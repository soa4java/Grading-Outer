package com.easytnt.grading.controller;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.easytnt.commons.web.view.ModelAndViewFactory;
import com.easytnt.grading.domain.exam.Subject;
import com.easytnt.grading.domain.exam.SubjectExam;
import com.easytnt.grading.domain.paper.ExamPaper;
import com.easytnt.grading.service.SubjectExamService;
import com.easytnt.grading.service.SubjectService;

@Controller
@RequestMapping(value = "/subjectExam")
public class SubjectExamController {
	private static Logger logger = LoggerFactory.getLogger(SubjectExamController.class);

	@Autowired(required = false)
	private SubjectExamService subjectExamService;
	
	@Autowired(required = false)
	private SubjectService subjectService;
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView onCreateSubjectExam(@RequestBody SubjectExam subjectExam)
					throws Exception {
		logger.debug("URL /subjectExam Method POST ", subjectExam);
		subjectExam.getSubject().setSubjectCode(subjectService.getMaxCode());
		for(ExamPaper ep:subjectExam.getUsedPaper()){
			ep.addSubjectExams(subjectExam);
			subjectExam.addExamPapers(ep);
		}
		subjectExamService.create(subjectExam);
		return ModelAndViewFactory.newModelAndViewFor("/exam/editExam").build();
	}
	@RequestMapping(method = RequestMethod.PUT)
	public ModelAndView onUpdateSubjectExam(@RequestBody SubjectExam subjectExam)
			throws Exception {
		logger.debug("URL /subjectExam Method PUT ", subjectExam);
		SubjectExam sub = subjectExamService.load(subjectExam.getTestId());
		//Subject  subject =  subjectExam.getSubject();
		sub.getSubject().setName( subjectExam.getSubject().getName());
		//subject.setId(sub.getSubject().getId());
		//sub.setSubject(subject);
		sub.setUsedPaper(getNewSet(sub.getUsedPaper(),subjectExam.getUsedPaper()));
		subjectExamService.update(sub);
		return ModelAndViewFactory.newModelAndViewFor("/exam/editExam").build();
	}
	@RequestMapping(method = RequestMethod.DELETE)
	public ModelAndView onDeleteSubjectExam(@RequestBody SubjectExam subjectExam)
					throws Exception {
		logger.debug("URL /subject Method DELETE ", subjectExam);
		subjectExam = subjectExamService.load(subjectExam.getTestId());
		subjectExamService.delete(subjectExam);
		return ModelAndViewFactory.newModelAndViewFor().build();
	}
	
	private Set<ExamPaper> getNewSet(Set<ExamPaper> oldSet,Set<ExamPaper> newSet){
		Set<ExamPaper> resultSet = new LinkedHashSet<ExamPaper>();
		for(ExamPaper newExamPaper:newSet){
			for(ExamPaper oldExamPaper:oldSet){
				oldExamPaper.setFullScore(newExamPaper.getFullScore());
				oldExamPaper.setObjectivityScore(newExamPaper.getObjectivityScore());
				oldExamPaper.setSubjectivityScore(newExamPaper.getSubjectivityScore());
				resultSet.add(oldExamPaper);
			}
		}
		return resultSet;
	}
}
