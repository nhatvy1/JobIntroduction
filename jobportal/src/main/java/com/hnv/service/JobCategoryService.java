package com.hnv.service;

import com.hnv.pojo.JobCategory;
import java.util.List;

public interface JobCategoryService {
    List<JobCategory> getJobCategories();
    boolean addJobCategory(JobCategory jobCategories);
}
