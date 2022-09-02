/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hnv.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author user
 */
@Entity
@Table(name = "job_posting")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "JobPosting.findAll", query = "SELECT j FROM JobPosting j"),
    @NamedQuery(name = "JobPosting.findById", query = "SELECT j FROM JobPosting j WHERE j.id = :id"),
    @NamedQuery(name = "JobPosting.findByName", query = "SELECT j FROM JobPosting j WHERE j.name = :name"),
    @NamedQuery(name = "JobPosting.findByDescription", query = "SELECT j FROM JobPosting j WHERE j.description = :description"),
    @NamedQuery(name = "JobPosting.findByExperience", query = "SELECT j FROM JobPosting j WHERE j.experience = :experience"),
    @NamedQuery(name = "JobPosting.findBySalary", query = "SELECT j FROM JobPosting j WHERE j.salary = :salary"),
    @NamedQuery(name = "JobPosting.findByJobLocation", query = "SELECT j FROM JobPosting j WHERE j.jobLocation = :jobLocation"),
    @NamedQuery(name = "JobPosting.findByImage", query = "SELECT j FROM JobPosting j WHERE j.image = :image"),
    @NamedQuery(name = "JobPosting.findByCreatedDate", query = "SELECT j FROM JobPosting j WHERE j.createdDate = :createdDate")})
public class JobPosting implements Serializable {

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "jobPostingId", fetch = FetchType.EAGER)
    private Set<Comment> commentSet;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45, message = "{posting.name.lengthError}")
    @Column(name = "name")
    private String name;
    @Size(max = 300)
    @Column(name = "description")
    private String description;
    @Size(max = 300)
    @Column(name = "experience")
    private String experience;
    @Column(name = "salary")
    private Long salary;
    @Size(max = 45)
    @Column(name = "job_location")
    private String jobLocation;
    @Size(max = 200)
    @Column(name = "image")
    private String image;
    @Basic(optional = false)
    @NotNull
    @Column(name = "created_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "jobPostingId")
    @JsonIgnore
    private Set<ApplyDetail> applyDetailSet;
    @JoinColumn(name = "job_category_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    @JsonIgnore
    private JobCategory jobCategoryId;
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    @JsonIgnore
    private User userId;
    @Transient
    private MultipartFile file;

    public JobPosting() {
    }

    public JobPosting(Integer id) {
        this.id = id;
    }

    public JobPosting(Integer id, String name, Date createdDate) {
        this.id = id;
        this.name = name;
        this.createdDate = createdDate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public Long getSalary() {
        return salary;
    }

    public void setSalary(Long salary) {
        this.salary = salary;
    }

    public String getJobLocation() {
        return jobLocation;
    }

    public void setJobLocation(String jobLocation) {
        this.jobLocation = jobLocation;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    @XmlTransient
    public Set<ApplyDetail> getApplyDetailSet() {
        return applyDetailSet;
    }

    public void setApplyDetailSet(Set<ApplyDetail> applyDetailSet) {
        this.applyDetailSet = applyDetailSet;
    }

    public JobCategory getJobCategoryId() {
        return jobCategoryId;
    }

    public void setJobCategoryId(JobCategory jobCategoryId) {
        this.jobCategoryId = jobCategoryId;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof JobPosting)) {
            return false;
        }
        JobPosting other = (JobPosting) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.hnv.pojo.JobPosting[ id=" + id + " ]";
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    @XmlTransient
    public Set<Comment> getCommentSet() {
        return commentSet;
    }

    public void setCommentSet(Set<Comment> commentSet) {
        this.commentSet = commentSet;
    }

}
