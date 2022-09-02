package com.hnv.formatter;

import com.hnv.pojo.JobCategory;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

public class JobCategoryFormatter implements Formatter<JobCategory>{

    @Override
    public String print(JobCategory categoryId, Locale locale) {
        return String.valueOf(categoryId.getId());
    }

    @Override
    public JobCategory parse(String categoryId, Locale locale) throws ParseException {
        JobCategory jobCategory = new JobCategory();
        jobCategory.setId(Integer.parseInt(categoryId));
        
        return jobCategory;
    }

    
    
}
