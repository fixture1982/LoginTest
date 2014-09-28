// JavaScript Document

var enable=0; today=new Date();                             
var day; var date;                             
var time_start = new Date();                              
var clock_start = time_start.getTime();                            
if(today.getDay()==0)  day="星期日"                                                  
if(today.getDay()==1)  day="星期一"                                                      
if(today.getDay()==2)  day="星期二"                            
if(today.getDay()==3)  day="星期三"                            
if(today.getDay()==4)  day="星期四"                            
if(today.getDay()==5)  day="星期五"                             
if(today.getDay()==6)  day="星期六"                             
yr = today.getYear();                            
if (yr < 1000)                            
yr+=1900;                                         
//date=yr+"年"+(today.getMonth()+1)+"月"+today.getDate()+"日 ";                        
date=(today.getMonth()+1)+"月"+today.getDate()+"日 ";                        
document.getElementById("dTime").innerHTML=date+day;



	




function login_check() {
		if (document.login.username.value=="") {
			alert("请输入你的用户名.");
			return false;
		} else if(document.login.username.value.length<2) {
			alert("用户名无效，请重新输入.");
			return false;
		} else if(document.login.password.value=="") {
			alert("请输入你的密码.");
			return false;
		} else if(document.login.password.value.length<2) {
			alert("密码无效，请重新输入.");
			return false;
		} else {
			return true;
		}
}






function divSwitch1(obj){
	if (obj.className=="dHidde"){
		obj.className="dDisplay";
	}else{
		obj.className="dHidde";
	}
}










