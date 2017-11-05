package com.smsone.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.smsone.model.House;
import com.smsone.model.Owner;
import com.smsone.model.Room;
import com.smsone.model.User;
import com.smsone.service.HouseService;
import com.smsone.service.OwnerService;
import com.smsone.service.RoomService;
import com.smsone.service.UserService;
import com.smsone.util.PlacesUtility;

@Controller
@RequestMapping("/")
public class UserController {
	@Autowired
	private OwnerService ownerService;
	@Autowired
	private UserService userService;
	@Autowired
	private HouseService houseService;
	@Autowired
	private RoomService roomService;
	@Autowired
	private MailSender mailSender;
	//show home
	@RequestMapping(value = "/showHome")
	public String showHome()
	{
		return "home";
	}
	
	//show short term
	@RequestMapping(value = "/showShortTerm")
	public String showShortTerm()
	{
		return "shortTerm";
	}
	
	//show long term
	@RequestMapping(value = "/showLongTerm")
	public String showLongTerm()
	{
		return "longTerm";
	}
	//show Owner page
	@RequestMapping(value = "/showOwnerPage")
	public String showOwnerPage()
	{
		return "owner";
	}
	//show user reg page
	@RequestMapping(value = "/showUserReg")
	public String showUserRegistration()
	{
		return "userRegistration";
	}
	//save user
	@RequestMapping(value = "/saveUser", method = RequestMethod.POST)
	public String saveUser(@RequestParam("firstName") String firstName,@RequestParam("contactNumber")Long contactNumber,@RequestParam("aadharNumber")Long aadharNumber,@RequestParam("pincode")Integer pincode,
			@RequestParam("country")String country,@RequestParam("motherTounge")String motherTongue,@RequestParam("password1")String password,@RequestParam("profession")String profession,	@RequestParam("lastName")String lastName,
		@RequestParam("email")String email,@RequestParam("city")String city,@RequestParam("state")String state,@RequestParam("gender")String gender,@RequestParam("foodPreference")String foodPreference,@RequestParam("address")String address)
	{
		User user=new User();
		user.setFirstName(firstName);
		user.setContactNumber(contactNumber);
		user.setAddress(address);
		user.setPincode(pincode);
		user.setCountry(country);
		user.setMotherTongue(motherTongue);
		user.setProfession(profession);
		user.setPassword(password);
		user.setAddress(address);
		user.setLastName(lastName);
		user.setEmail(email);
		user.setCity(city);
		user.setState(state);
		user.setGender(gender);
		user.setFoodPreference(foodPreference);
		user.setAadharNumber(aadharNumber);
		userService.saveUser(user);
		
		return "success";
	}
	
	//show house reg page
	@RequestMapping(value = "/showHouseReg")
	public String showHouseRegistration()
	{
		return "houseRegistration";
	}
	//save house
	@RequestMapping(value = "/saveHouse",method = RequestMethod.POST)
	public String saveHouse(@RequestParam("aadharNumber")Long aadharNumber,@RequestParam("floorNumber")Integer floorNumber,@RequestParam("accomodation")String accomodation,
	@RequestParam("rent")Double rent,@RequestParam("area")Double area,@RequestParam("img1")MultipartFile img1,@RequestParam("houseName")String houseName,@RequestParam("img2")MultipartFile img2,@RequestParam("img3")MultipartFile img3,@RequestParam("tenancyType")String tenancyType,@RequestParam("room")Integer room,
	@RequestParam("foodPreference")String foodPreference,@RequestParam("deposit")Double deposit,@RequestParam("address")String address) throws IOException,SerialException
	{
		House house=new House();
		house.setAadharNumber(aadharNumber);
		house.setAccomodation(accomodation);
		house.setAddress(address);
		house.setArea(area);
		house.setDeposit(deposit);
		house.setFloorNumber(floorNumber);
		house.setFoodPreference(foodPreference);
		house.setRent(rent);
		house.setRoom(room);
		house.setTenancyType(tenancyType);
		byte[] img11 = img1.getBytes();
		byte[] img13 = img2.getBytes();
		byte[] img12 = img3.getBytes();
		house.setImg1(img11);
		house.setImg2(img12);
		house.setImg3(img13);
		house.setHouseName(houseName);
		houseService.saveHouse(house);
		return "success";
	}
	
	//show owner reg page
	@RequestMapping(value = "/showOwnerReg")
	public String showOwnerRegistration()
	{
		return "ownerRegistration";
	}
	//save owner
	@RequestMapping(value = "/saveOwner", method = RequestMethod.POST)
	public String saveOwner(@RequestParam("firstName") String firstName,@RequestParam("contactNumber")Long contactNumber,@RequestParam("password1") String password,
			@RequestParam("aadharNumber") Long aadharNumber,@RequestParam("lastName") String lastName,@RequestParam("email") String email)
	{
		Owner owner=new Owner();
		owner.setFirstName(firstName);
		owner.setLastName(lastName);
		owner.setContactNumber(contactNumber);
		owner.setEmail(email);
		owner.setAadharNumber(aadharNumber);
		owner.setPassword(password);
		ownerService.saveOwner(owner);
		return "success";
	}
	
	
	//show deal1 page
	@RequestMapping(value = "/showDeal1")
	public String showDeal1()
	{
		return "deal1";
	}
	
	//show know more page
	@RequestMapping(value = "/showKnowMore")
	public String showKnowMore()
	{
		return "knowMore";
	}
	
	//show Terms and condition page
	@RequestMapping(value = "/showTermsAndCondition")
	public String showTermsAndCondition()
	{
		return "termsAndCondition";
	}
	
	//show help page
	@RequestMapping(value = "/showHelp")
	public String showHelp()
	{
		return "help";
	}
		
	//show filter based on requirements
	@RequestMapping(value = "/showFilter111")
	public String showFilter(@RequestParam("profession") String profession,@RequestParam("language") String language,@RequestParam("address") String address,
	@RequestParam("accomodation") String accomodation,@RequestParam("food") String food,@RequestParam("price") String price[])
	{
		return "filter";
	}	
	//sort record
	@RequestMapping(value="/sortPrice")
	public String Sortist(@RequestParam("priceSort")String priceSort,Model model, Integer offset, Integer maxResults){
		model.addAttribute("house", houseService.list(offset, maxResults));	
		model.addAttribute("count", houseService.count());
		model.addAttribute("offset", offset);
			return "filter";
		}	
		@RequestMapping(value = "/showHomeResult")
		public String showHomeResult()
		{
			return "filter";
		}
		
		@RequestMapping(value = "/showHeader")
		public String showHeader()
		{
			return "header";
		}
		
		
		@RequestMapping(value = "/showCheckEmail")
		public String showSuccess()
		{
			return "checkEmailVerify";
		}
		
		
	
		
		//show house info
		@RequestMapping(value = "/showHouseInfo/{hId}")
		public String showHouseInfo(@PathVariable("hId") Long hId,Model model)
		{
			House house=new House();
			house.sethId(hId);
			house=houseService.getHouse(house);
			model.addAttribute("house",house);
			return "houseInfo";
		}
		//show room reg form
		@RequestMapping(value = "/showRoomReg")
		public String showRoomReg()
			{
				return "roomReg";
			}
		//save room details
		@RequestMapping(value = "/saveRoom", method = RequestMethod.POST)
		public String saveRoom(@RequestParam("roomID")Long roomId,@RequestParam("roomType")String roomType,@RequestParam("ac")String ac,@RequestParam("wifi")String wifi,
				@RequestParam("bathroom")String bathroom,@RequestParam("geyser")String geyser,@RequestParam("bed")String bed,@RequestParam("swimmingPool")String swimmingPool,
				@RequestParam("gym")String gym,@RequestParam("NumberOfBed")Integer numberOfBed,@RequestParam("foodAvailability")String foodAvailability,@RequestParam("img1")MultipartFile img1,@RequestParam("img2")MultipartFile img2,@RequestParam("img3")MultipartFile img3) throws IOException
		{
			Room room=new Room();
			room.setRoomId(roomId);
			room.setRoomtype(roomType);
			room.setAc(ac);
			room.setWifi(wifi);
			room.setBathroom(bathroom);
			room.setGeyser(geyser);
			room.setBed(bed);
			room.setSwimmingPool(swimmingPool);
			room.setGym(gym);
			room.setNumberOfBed(numberOfBed);
			room.setFoodAvailability(foodAvailability);
			byte[] img11 = img1.getBytes();
			byte[] img13 = img2.getBytes();
			byte[] img12 = img3.getBytes();
			room.setImg1(img11);
			room.setImg2(img12);
			room.setImg3(img13);
			roomService.saveRoom(room);
			return "success";
		}
		
		
		
		@RequestMapping(value = "/showComposeMail")
		public String showComposeMail()
		{
			return "composeMail";
		}
		
		
		@RequestMapping("/checkId1")
		public @ResponseBody String checkEmpIdExist(@RequestParam("email")int email){
			String msg=null;
			//if
			
			if(email==1){
				msg="Employee with id "+email+", already Exist";
			}else{
				msg="";
			}
			
			return msg;
		}
		//check user mail
		@RequestMapping(value = "/checkUserMail")
		public @ResponseBody String checkEmail(@RequestParam("email") String email)
		{
			String msg=null;
			User user=new User();
			user.setEmail(email);
			boolean flag=userService.checkEmail(user);
			if(flag==true)
			{
				msg="alreday used mail id";
			}
			else
			{
				msg="";
			}
			return msg;
		}
		//check user contact number
		@RequestMapping(value = "/checkContactNumber")
		public @ResponseBody String checkContactNumber(@RequestParam("contactNumber") Long contactNumber)
		{
			String msg=null;
			User user=new User();
			user.setContactNumber(contactNumber);
			boolean flag=userService.checkContactNumber(user);
			if(flag==true)
			{
				msg="alreday used contact number";
			}
			else
			{
				msg="";
			}
			return msg;
		}
		
		//check user aadhar Number
				@RequestMapping(value = "/checkAadharNumber")
				public @ResponseBody String checkAadharNumber(@RequestParam("aadharNumber") Long aadharNumber)
				{
					String msg=null;
					User user=new User();
					user.setAadharNumber(aadharNumber);
					boolean flag=userService.checkAadharNumber(user);
					if(flag==true)
					{
						msg="alreday used Aadhar number";
					}
					else
					{
						msg="";
					}
					return msg;
				}
				//check house owner aadhar Number
				@RequestMapping(value = "/checkOwnerAadharNumber")
				public @ResponseBody String checkOwnerAadharNumber(@RequestParam("aadharNumber") Long aadharNumber)
				{
					String msg=null;
					House house=new House();
					house.setAadharNumber(aadharNumber);
					boolean flag=houseService.checkAadharNumber(house);
					if(flag==true)
					{
						msg="alreday used Aadhar number";
					}
					else
					{
						msg="";
					}
					return msg;
				}

				//check owner aadhar Number
				@RequestMapping(value = "/checkOwnerAadharNumber1")
				public @ResponseBody String checkOwnerAadharNumber1(@RequestParam("aadharNumber") Long aadharNumber)
				{
					String msg=null;
					Owner owner=new Owner();
					owner.setAadharNumber(aadharNumber);
					boolean flag=ownerService.checkAadharNumber(owner);
					if(flag==true)
					{
						msg="alreday used Aadhar number";
					}
					else
					{
						msg="";
					}
					return msg;
				}
				
				
				//check owner contact Number
				@RequestMapping(value = "/checkOwnerContactNumber")
				public @ResponseBody String checkOwnerContactNumber(@RequestParam("contactNumber") Long contactNumber)
				{
					String msg=null;
					Owner owner=new Owner();
					owner.setContactNumber(contactNumber);
					boolean flag=ownerService.checkContactNumber(owner);
					if(flag==true)
					{
						msg="alreday used contact number";
					}
					else
					{
						msg="";
					}
					return msg;
				}

				//check owner email
				@RequestMapping(value = "/checkOwnerEmail")
				public @ResponseBody String checkOwnerEmail(@RequestParam("email") String email)
				{
					String msg=null;
					Owner owner=new Owner();
					owner.setEmail(email);
					boolean flag=ownerService.checkEmail(owner);
					if(flag==true)
					{
						msg="alreday used email";
					}
					else
					{
						msg="";
					}
					return msg;
				}
				//login check
				@RequestMapping(value = "/login", method = RequestMethod.POST)
				public @ResponseBody  String login(@RequestParam("email") String email,@RequestParam("password") String password)
				{
					String msg=null;
					User user=new User();
					user.setEmail(email);
					user.setPassword(password);
					boolean flag=userService.checkLogin(user);
					if(flag==false)
					{
						msg="please enter valid email and password";
					}
					else
					{
						msg="";
					}
					return msg;
					
				}
				
				//plcae autocomplte
				@RequestMapping(value = "/listAddress", method = RequestMethod.GET)
				public @ResponseBody
				List<String> getAddressList(@RequestParam String input) {
					try {
						return PlacesUtility.getData(input);
					} catch (IOException e) {
						return new ArrayList<String>();
					}
				}
				//mapCheckshow
				@RequestMapping(value = "/showMapCheck")
				public String showMapCheck()
				{
					return "mapCheck";
					
				}
				//show payment page
				@RequestMapping(value = "/showHouseInfo/showPaymentPage")
				public String showPaymentPage1()
				{
					return "redirect:/showPaymentPage";
					
				}
				@RequestMapping(value = "showPaymentPage")
				public String showPaymentPage()
				{
					return "payment";
					
				}
				//show room info
				@RequestMapping(value = "/showHouseInfo/showRoomInfo")
				public String showRoominfo()
				{
					return "redirect:/showRoomInfo";
				}
				
				@RequestMapping(value = "/showRoomInfo")
				public String showRoominfo1()
				{
					return "roomInfo";
					
				}
				
			

				//send mail
				@RequestMapping(value="/sendMail",method = RequestMethod.POST)
				public String sendMail(@RequestParam("firstName")String firstName,@RequestParam("email")String email,@RequestParam("phoneNumber")String phoneNumber,@RequestParam("message")String message)
				{
					
					SimpleMailMessage simpleMailMessage=new SimpleMailMessage();
					simpleMailMessage.setTo("desaiswapnil1823@gmail.com");
					simpleMailMessage.setFrom("swapnildesai162@gmail.com");
					simpleMailMessage.setSubject("for contact us");
					simpleMailMessage.setText("first name:"+firstName+" email:"+email+" phoneNumber:"+phoneNumber+" message:"+message);
					mailSender.send(simpleMailMessage);
					return "success";
				}
				
				//show filter with results 
				
				@RequestMapping(value="/showFilter")
				public String list(Model model, Integer offset, Integer maxResults){
					model.addAttribute("house", houseService.list(offset, maxResults));
					model.addAttribute("count", houseService.count());
					model.addAttribute("offset", offset);
					return "filter";
					}
				
				//filter page response with only address
				@RequestMapping(value="/showFilter1")
				public String listHouse(@RequestParam("address") String address,Model model, Integer offset, Integer maxResults){
					if(address.isEmpty())
					{
						 return "redirect:/showFilter";

					}
					else
					{
					House house=new House();
					house.setAddress(address);
					model.addAttribute("house", houseService.listHouse(house,offset, maxResults));
					model.addAttribute("count", houseService.count());
					model.addAttribute("offset", offset);
					return "filter";
					}
				}
				
				//filter page response with filter
				@RequestMapping(value="/showFilter2")
				public String listHouseByFilter(@RequestParam("profession") String profession,@RequestParam("language") String language,@RequestParam("subcategory") String address,@RequestParam("accomodation") String accomodation,@RequestParam("food") String food,@RequestParam("price") Double rent,Model model, Integer offset, Integer maxResults){
					House house=new House();
					house.setAddress(address);
					house.setAccomodation(accomodation);
					house.setRent(rent);
					house.setFoodPreference(food);
					model.addAttribute("house", houseService.listHouseByFilter(house,offset, maxResults));
					model.addAttribute("count", houseService.count());
					model.addAttribute("offset", offset);
					return "filter";
				}

}


