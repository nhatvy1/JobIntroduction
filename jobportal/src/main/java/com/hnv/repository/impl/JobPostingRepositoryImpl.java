package com.hnv.repository.impl;

import com.hnv.pojo.Comment;
import com.hnv.pojo.JobPosting;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.hnv.repository.JobPostingRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.persistence.Query;
import javax.persistence.criteria.Predicate;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;

@Repository
@PropertySource("classpath:messages.properties")
@Transactional
public class JobPostingRepositoryImpl implements JobPostingRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Autowired
    private Environment env;

    @Override
    public Long countPosting() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Long> q = builder.createQuery(Long.class);
        Root root = q.from(JobPosting.class);
        q.select(builder.count(root.get("id")));

        Query query = session.createQuery(q);
        return (Long) query.getSingleResult();
    }

    @Override
    public List<JobPosting> getJobPosting(Map<String, String> params, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<JobPosting> q = builder.createQuery(JobPosting.class);
        Root root = q.from(JobPosting.class);
        q.select(root);

        
        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();
            if (params.containsKey("keyword") == true) {
                Predicate p1 = builder.like(builder.lower(root.get("name").as(String.class)),
                        String.format("%%%s%%", params.get("keyword")).toLowerCase());
                predicates.add(p1);
            }

            if (params.containsKey("cateId") == true) {
                int cateId = Integer.parseInt(params.get("cateId"));
                Predicate p2 = builder.equal(root.get("jobCategoryId"), cateId);
                predicates.add(p2);
            }

            q = q.where(predicates.toArray(new Predicate[]{}));
        }
        
        q = q.orderBy(builder.desc(root.get("id")));
        Query query = session.createQuery(q);
        
        // Phân trang
        if (page > 0) {
            int size = Integer.parseInt(env.getProperty("page.size").toString());
            int start = (page - 1) * size;
            query.setFirstResult(start);
            query.setMaxResults(size);
        }
        
        return query.getResultList();
    }

    @Override
    public boolean addPosting(JobPosting jobPosting) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(jobPosting);
            return true;
        } catch (Exception e) {
            System.err.println("add job posting " + e.getMessage());
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public JobPosting getJobPostingById(int postingId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(JobPosting.class, postingId);
    }

    @Override
    public List<Comment> getComments(int jobPostingId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Comment> q = b.createQuery(Comment.class);
        Root root = q.from(Comment.class);
        q.select(root);
        
        q.where(b.equal(root.get("jobPostingId"), jobPostingId));
        
        Query query = session.createQuery(q);
        return query.getResultList();
    }
}
