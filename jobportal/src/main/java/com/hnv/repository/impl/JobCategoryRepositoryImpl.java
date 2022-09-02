package com.hnv.repository.impl;

import com.hnv.pojo.JobCategory;
import com.hnv.repository.JobCategoryRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class JobCategoryRepositoryImpl implements JobCategoryRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public List<JobCategory> getJobCategories() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
//        CriteriaBuilder b = session.getCriteriaBuilder();
//        CriteriaQuery<JobCategory> q = b.createQuery(JobCategory.class);
//        Root root = q.from(JobCategory.class);
//        q.select(root);
//        Query query = session.createQuery(q);
        Query q = session.createQuery("From JobCategory");
        
        return q.getResultList();
    }

    @Override
    public boolean addJobCategory(JobCategory jobCategories) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        try {
            session.save(jobCategories);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }
    
}
