package com.hnv.repository;

import com.hnv.pojo.JobCategory;
import java.util.List;

public interface JobCategoryRepository {
    List<JobCategory> getJobCategories(); 
    boolean addJobCategory(JobCategory jobCategories);
}
