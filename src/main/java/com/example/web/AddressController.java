package com.example.web;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.persistence.AddressDAO;

@Controller
public class AddressController {
	@Inject
	AddressDAO dao;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(Integer page,Model model,String key,String word){
		if(page == null) page=1;
		if(key ==null) key="name";
		
		if(word==null) word="";
		/*
		System.out.println("page=" +page);
		System.out.println("key=" +key);
		System.out.println("word=" +word);
		*/
		int start=(page-1)*10;
		model.addAttribute("list", dao.list(start,key,word));
		
		int total=dao.total(key,word);
		int totPage=total/10;
		if(total % 10 !=0){
			totPage+=1;
		}
		
		model.addAttribute("total", total);
		model.addAttribute("totPage", totPage);
		model.addAttribute("key", key);
		model.addAttribute("word", word);
		model.addAttribute("page", page);
		return "list";
	}
}
