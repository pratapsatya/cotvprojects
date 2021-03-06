package com.hellokoding.auth.web;

import com.hellokoding.auth.model.User;
import com.hellokoding.auth.model.Mail;
import com.hellokoding.auth.model.Profile;
//import com.hellokoding.auth.model.Profile;
import com.hellokoding.auth.service.MailService;
import com.hellokoding.auth.service.MailServiceImpl;
import com.hellokoding.auth.service.ProfileService;
import com.hellokoding.auth.service.SecurityService;
import com.hellokoding.auth.service.UserService;
import com.hellokoding.auth.validator.UserValidator;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private MailService mailService;

    @Autowired
    private ProfileService profileService;


    
    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;
    
    /*@RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration() {
        //model.addAttribute("userForm", new User());

        return "registrationtest";
    }
    */
    /*@RequestMapping(value = "/redirect", method = RequestMethod.GET)
    public String redirect(@RequestParam(name="uname") String uname,@RequestParam("pwd") String pwd) {

    	userService.insertData(uname,pwd);
    	
    }*/
    

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/welcome";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout,Principal p) {
        
    	if(p != null)
    	{
    		
    		return "redirect:/welcome";
    	}
    	
    	if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {
    	
   	List<Object> loc=mailService.getLoc();
   	model.addAttribute("locations", loc);
   	
   	List<Object> lang=mailService.getLang();
   	model.addAttribute("languages", lang);
    	
		/*List<Mail> mails = mailService.getAllMoviesByLocAndLang("madhapur","telugu");

   	model.addAttribute("locations", mails);
*/
        return "welcome";
    }
    
    
    @RequestMapping(value = {"/choices"}, method = RequestMethod.GET)
    public String options(Model model,@RequestParam(name="locations") String locations,@RequestParam("languages") String languages) {
    	
    	List<Mail> list=mailService.getAllMoviesByLocAndLang(locations,languages);
    	model.addAttribute("list", list);
    	model.addAttribute("location", locations);

    	
        return "choices";
    }
    
    @RequestMapping(value = {"/profile"}, method = RequestMethod.GET)
    public String options(Model model,Principal p) {
    	
    	
    	
    	/*List<Mail> list=mailService.getAllMoviesByLocAndLang(locations,languages);
    	model.addAttribute("list", list);
    	model.addAttribute("location", locations);*/
    	String uname=p.getName();
    	List<String> profile=profileService.findByUname(uname);
    	
    	/*for(Profile x : profile)
    	System.out.println(""+x.);*/
    	model.addAttribute("profile", profile);

        return "profile";
    }
    
   /* @RequestMapping(value = {"/payment"}, method = RequestMethod.GET)
    public String payment(Model model,@RequestParam(name="movie") String movie,@RequestParam("tickets") String tickets) {
    	
    	//List<Mail> list=mailService.getAllMoviesByLocAndLang(locations,languages);
    	//model.addAttribute("list", list);
    	
        return "payment";
    }*/
    @RequestMapping(value = "/redirect", method = RequestMethod.GET)
    public String redirect(Model model,@RequestParam(name="movie") String movie,@RequestParam("tickets") Integer tickets,Principal p) {
       String uname=p.getName();
       System.out.println("****************************************************"+uname);
    	int tick=mailService.getTickets(movie);
       int newtick=tick-(tickets);
       //model.addAttribute("tick",tick);
      // model.addAttribute("newtick",newtick);
       int updatetick=mailService.updateTickets(movie,newtick);
       profileService.insertData(uname,movie, tickets);
       //model.addAttribute("updatetick",updatetick);
    	return "redirect:/welcome";
    }
}
