if(top.location!=self.location)
{
    top.location=self.location;
};
var g_elementsArr=null;
var g_regform=null;
var g_idx={apply_qq:0,apply_email:1,nick:2,agetype:3,age:4,age_month:5,age_day:6,gentle_male:7,gentle_female:8,pass:9,repass:10,country:11,state:12,city:13,validecode:14,end:15};
var g_start=new Date();
var g_ele_2_id_cache={};
var g_input_box=[2,10,14];//pass的有清空repass检查事件了,age有可能变成了select类型

//防止重复提交
var g_SubmitStatus= new Object();
(function _SS(obj)
{
    //: public
    obj.getStatus         = getStatus;
    obj.setStatusSubmit   = setStatusSubmit;
    obj.setStatusComplete = setStatusComplete;

    //: private
    var m_bSubmited = false;
    var m_timeoutId;
    function getStatus() 
    {
        return m_bSubmited;
    }
    function setStatusSubmit(timeout) 
    {
        m_bSubmited = true;
        window.status='正在提交...';
        f_showInfoInLayer($('loading_msg'), "正在提交，请勿操作...");
        f_showLayer($('loading'));
        m_timeoutId = setTimeout( setStatusComplete , timeout);
    }
    function setStatusComplete() 
    {
        m_bSubmited = false;
        clearTimeout( m_timeoutId );
        m_bSubmited = false; //多做一次，防止竞争关系的冲突
        window.status = '';
        f_hideLayer("loading");
    }
}
)(g_SubmitStatus);

function $(ld_ele)
{
    if(typeof(ld_ele)=="string")
    {
        return g_ele_2_id_cache[ld_ele]?g_ele_2_id_cache[ld_ele]:(g_ele_2_id_cache[ld_ele]=document.getElementById(ld_ele));
    }
    else
    {
        return ld_ele;
    };
};
var g_log_str="";
function log(a) 
{
    return true;
    if(navigator.userAgent.indexOf("Firefox")>-1) 
    {
        console.log(a);
    }else
    {
        if(g_log_str=="") 
        {
            document.ondblclick=function(){ if(!confirm(g_log_str + "---\nkeep it?")) g_log_str="\n"; };
        }
    }
    if(a=="-")
        g_log_str="\n";
    else
        g_log_str+=a+"\n";
};
var Util_List=
{
    mf_add: function(lo_ListObj,ld_Text,ld_Value)
    {
        var lo_Option=document.createElement("option");
        lo_Option.appendChild(document.createTextNode(ld_Text));
        lo_Option.setAttribute("value",ld_Value);
        lo_ListObj.appendChild(lo_Option);
    },
    mf_clear: function(lo_ListObj)
    {
        for(var ld_i=lo_ListObj.options.length-1;ld_i>=0;ld_i--)
        {
            try{
            //log("ld_i = "+ld_i);
            //log("OBJ  = "+lo_ListObj.options[ld_i].text);
            lo_ListObj.remove(ld_i);
            }
            catch(e){};
        };
    },
    mf_select: function(lo_ListObj,ld_Value)
    {
        var ld_i=0;
        for(;ld_i<lo_ListObj.options.length;ld_i++)
        {
            if(lo_ListObj.options[ld_i].value==ld_Value)
            {
                break;
            };
        };
        if(ld_i>=lo_ListObj.options.length)
        {
            return false;
        };
        try{ // IE6下该语句设置会报错，但仍然起作用，故用try包裹一下
        lo_ListObj.options[ld_i].selected=true;
        }catch(e){};
        lo_ListObj.selectedIndex=ld_i;
        lo_ListObj.value=ld_Value;
        return true;
    },
    mf_isempty: function(lo_ListObj)
    {
        if((lo_ListObj.options.length>0)&&(lo_ListObj.value==""))
        {
            return true;
        }
        else
        {
            return false;
        };
    }
};
var XmlHttp=
{
    mf_createxmlhttp: function()
    {
        var lo_http_request=false;
        if(window.ActiveXObject)
        {
            //var ld_xmlhttps=["MSXML2.XMLHTTP.5.0","MSXML2.XMLHTTP.4.0","MSXML2.XMLHTTP.3.0","MSXML2.XMLHTTP","Microsoft.XMLHTTP"];
            var ld_xmlhttps=["MSXML2.XMLHTTP.4.0","MSXML2.XMLHTTP.3.0","MSXML2.XMLHTTP","Microsoft.XMLHTTP"];
            for(var l_i=0;l_i<ld_xmlhttps.length;l_i++)
            {
                try
                {
                    lo_http_request=new ActiveXObject(ld_xmlhttps[l_i]);
                    break;
                }
                catch(ld_e)
                {
                    lo_http_request=false;
                };
            };
        }
        else
        {
            try
            {
                lo_http_request=new XMLHttpRequest();
            }
            catch(ld_e)
            {
                lo_http_request=false;
            };
        };
        return lo_http_request;
    },
    mf_sendrequest:function(lo_xmlhttp,ld_url,lf_process)
    {
        lo_xmlhttp.onreadystatechange=lf_process;
        lo_xmlhttp.open("GET",ld_url,true);
        lo_xmlhttp.send(null);
    },
    mf_sendrequest_sync:function(lo_xmlhttp,ld_url) 
    {
        lo_xmlhttp.open("GET",ld_url,false);
        lo_xmlhttp.send(null);
    },
    mf_postrequest:function(lo_xmlhttp,ld_url,lf_process,ld_data)
    {
        lo_xmlhttp.onreadystatechange=lf_process;
        lo_xmlhttp.open("POST",ld_url,true);
        lo_xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
        lo_xmlhttp.send(ld_data);
    }
};
var LocalList=
{
    mo_focusObj: null,
    mo_countryObj: null,
    mo_stateObj: null,
    mo_cityObj: null,
    mo_language1Obj: null,
    mo_language2Obj: null,
    mo_language3Obj: null,
/*
    md_countryDivId: "tr_country",
    md_stateDivId: "tr_state",
    md_cityDivId: "tr_city",
*/
    md_defaultCountry: "",
    md_defaultState: "",
    md_defaultCity: "",
    md_loadingId: "loading",
    md_load_completeId: "load_complete",
    md_http_request: false,
    md_loc_xml: false,
    md_bgetfailed: false,
    md_bInit: false,
    md_bAreaLoaded: false,
    md_bUpdate: false,
/*
    mf_update: function()
    {
        if(!this.md_bUpdate&&this.md_loc_xml&&this.md_bAreaLoaded)
        {
            f_hideLayer(this.md_loadingId);
            f_showLayer(this.md_load_completeId);
            try{
                this.mo_focusObj.focus();
            }catch(l_e){
            };
            this.md_bUpdate=true;
        };
    },
*/
    mf_init: function(lo_focusObj,lo_countryObj,lo_stateObj,lo_cityObj,ld_defaultArea)
    {
        this.mo_focusObj=lo_focusObj;
        this.mo_countryObj=lo_countryObj;
        this.mo_stateObj=lo_stateObj;
        this.mo_cityObj=lo_cityObj;
/*
        this.mo_language1Obj=lo_language1Obj;
        this.mo_language2Obj=lo_language2Obj;
        this.mo_language3Obj=lo_language3Obj;
*/
        var l_area=ld_defaultArea.split("|");
        this.md_defaultCountry = (l_area[0]?l_area[0]:"");
        this.md_defaultState = (l_area[1]?l_area[1]:"");
        this.md_defaultCity = (l_area[2]?l_area[2]:"");
        this.md_bInit=true;
        //this.mf_initLanguageList();
    },
    mf_getinfo: function()
    {
        var ld_url="/js/chinese.xml";
        if(navigator.userAgent.indexOf("Opera")>-1)
        {
            ld_url+=("?seed="+Math.random());
        };
        this.md_http_request=XmlHttp.mf_createxmlhttp();
        if(!this.md_http_request)
        {
            return false;
        };
        this.md_bgetfailed=false;
        //XmlHttp.mf_sendrequest(this.md_http_request,ld_url,this.mf_RecvLocList);
        XmlHttp.mf_sendrequest_sync(this.md_http_request,ld_url);
        this.mf_RecvLocList();
        return true;
    },
    mf_RecvLocList: function()
    {
       // log("readyState = "+LocalList.md_http_request.readyState);
        if(LocalList.md_http_request.readyState==4)
        {
           // log("http status = "+LocalList.md_http_request.status);
            if(LocalList.md_http_request.status==200)
            {
                LocalList.md_loc_xml=LocalList.md_http_request.responseXML.documentElement;
                LocalList.mf_initUpdate();
            }
            else
            {
                LocalList.md_bgetfailed=true;
                alert("Get area list failed, please refresh and try it again!");
            };
        };
    },
    mf_initUpdate: function()
    {
        if (!this.md_bInit || !this.md_loc_xml)
        {
            setTimeout("LocalList.mf_initUpdate();",500);
            return;
        };
        this.mf_processCountryList();
        if(this.md_defaultCountry!="")
        {
            if(Util_List.mf_select(this.mo_countryObj,this.md_defaultCountry))
            {
                this.mf_processStateList();
/*
                var lo_Countrys=this.md_loc_xml.getElementsByTagName("CountryRegion");
                var l_i=0;
                for(l_i=0;l_i<lo_Countrys.length;l_i++)
                {
                    if(lo_Countrys[l_i].getAttribute("Code")==this.md_defaultCountry)
                    {
                         break;
                    };
                };
                if(l_i<lo_Countrys.length)
                {
                    var lo_Languages=lo_Countrys[l_i].getElementsByTagName("Language");
                    if(lo_Languages.length>=1)
                    {
                        var ld_LanguageCode=lo_Languages[0].getAttribute("Code");
                        if(ld_LanguageCode&&(ld_LanguageCode!=""))
                        {
                            Util_List.mf_select(this.mo_language1Obj,ld_LanguageCode);
                        };
                    };
                };
*/
            };
        };
        if(this.md_defaultState!="")
        {
            if(Util_List.mf_select(this.mo_stateObj,this.md_defaultState))
            {
                this.mf_processCityList();
            };
        };
        if(this.md_defaultCity!="") 
        {
            if(Util_List.mf_select(this.mo_cityObj,this.md_defaultCity))
            {
                ;
            };
        };
        /*
        //sleep(2);
        Util_List.mf_select(this.mo_countryObj,this.md_defaultCountry);
        Util_List.mf_select(this.mo_stateObj,this.md_defaultState);
        Util_List.mf_select(this.mo_cityObj,this.md_defaultCity);
        */
        this.md_bAreaLoaded=true;
        //this.mf_update();
        return true;
    },
    mf_processCountryList: function()
    {
        if(!this.md_bInit || !this.md_loc_xml)
        {
            return;
        };
        //var lo_CountryDivObj=$(this.md_countryDivId);
        var lo_CountryDivObj=this.mo_countryObj;
        lo_CountryDivObj.style.display="none";
        Util_List.mf_clear(this.mo_countryObj);
        var lo_Countrys=this.md_loc_xml.getElementsByTagName("CountryRegion");
        var ld_text="",ld_value="";
        for(var l_i=0;l_i<lo_Countrys.length;l_i++)
        {
            ld_text=lo_Countrys[l_i].getAttribute("Name");
            ld_value=lo_Countrys[l_i].getAttribute("Code");
            Util_List.mf_add(this.mo_countryObj,ld_text,ld_value);
        };
        lo_CountryDivObj.style.display="inline";
        this.mf_processStateList();
    },
    mf_processStateList: function()
    {
        if(!this.md_bInit || !this.md_loc_xml)
        {
            return;
        };
        //var lo_StateDivObj=$(this.md_stateDivId);
        var lo_StateDivObj=this.mo_stateObj;
        lo_StateDivObj.style.display="none";
        Util_List.mf_clear(this.mo_stateObj);
        do
        {
            var lo_Countrys=this.md_loc_xml.getElementsByTagName("CountryRegion");
            var ld_Country=this.mo_countryObj.value;
            var l_i=0;
            for(l_i=0;l_i<lo_Countrys.length;l_i++)
            {
                if(lo_Countrys[l_i].getAttribute("Code")==ld_Country)
                {
                     break;
                };
            };
            if(l_i>=lo_Countrys.length)
            {
                break;
            };
            var lo_States=lo_Countrys[l_i].getElementsByTagName("State");
            if(lo_States.length<=1) //=1时表示没有省这一级单位
            {
                break;
            };
            var ld_text="",ld_value="";
            for(l_i=0;l_i<lo_States.length;l_i++)
            {
                ld_text=lo_States[l_i].getAttribute("Name");
                ld_value=lo_States[l_i].getAttribute("Code");
                Util_List.mf_add(this.mo_stateObj,ld_text,ld_value);
            };
            lo_StateDivObj.style.display="inline";
            if(this.md_bUpdate&&(Util_List.mf_isempty(this.mo_stateObj)))
            {
                this.mo_stateObj.focus();
            };
        }while(false);
        if(lo_StateDivObj.style.display=="none")
        {
            //ErrMapUtil.mf_DelFromErrMap(g_TitleArr[6]);
        };
        this.mf_processCityList();
    },
    mf_processCityList: function()
    {
        if(!this.md_bInit || !this.md_loc_xml)
        {
            return;
        };
        //var lo_CityDivObj=$(this.md_cityDivId);
        var lo_CityDivObj=this.mo_cityObj;
        lo_CityDivObj.style.display="none";
        Util_List.mf_clear(this.mo_cityObj);
        do
        {
            var lo_Countrys=this.md_loc_xml.getElementsByTagName("CountryRegion");
            var ld_Country=this.mo_countryObj.value;
            var l_i=0;
            for(l_i=0;l_i<lo_Countrys.length;l_i++)
            {
                if(lo_Countrys[l_i].getAttribute("Code")==ld_Country)
                {
                     break;
                };
            };
            if(l_i>=lo_Countrys.length)
            {
                break;
            };
            var lo_States=lo_Countrys[l_i].getElementsByTagName("State");
            l_i=0;
            if(lo_States.length>1)
            {
                var ld_State=this.mo_stateObj.value;
                for(;l_i<lo_States.length;l_i++)
                {
                    if(lo_States[l_i].getAttribute("Code")==ld_State)
                    {
                         break;
                    };
                };
                if(l_i>=lo_States.length)
                {
                    break;
                };
            }
            else if(lo_States.length<=0)
            {
                break;
            };
            var lo_Citys=lo_States[l_i].getElementsByTagName("City");
            if(lo_Citys.length<=0)
            {
                break;
            };
            var ld_text="",ld_value="";
            for(l_i=0;l_i<lo_Citys.length;l_i++)
            {
                ld_text=lo_Citys[l_i].getAttribute("Name");
                ld_value=lo_Citys[l_i].getAttribute("Code");
                Util_List.mf_add(this.mo_cityObj,ld_text,ld_value);
            };
            lo_CityDivObj.style.display="inline";
            if(this.md_bUpdate&&(Util_List.mf_isempty(this.mo_cityObj)))
            {
                this.mo_cityObj.focus();
            };
        }while(false);
        if(lo_CityDivObj.style.display=="none")
        {
//            ErrMapUtil.mf_DelFromErrMap(g_TitleArr[7]);
        };
    },
    mf_initLanguageList: function()
    {
/*
        if(!this.md_bInit)
        {
            return;
        };
        Util_List.mf_clear(this.mo_language1Obj);
        Util_List.mf_clear(this.mo_language2Obj);
        Util_List.mf_clear(this.mo_language3Obj);
        for(var l_i=0;l_i<g_LanguageArr[0].length;l_i++)
        {
            Util_List.mf_add(this.mo_language1Obj, g_LanguageArr[0][l_i],g_LanguageArr[1][l_i]);
            Util_List.mf_add(this.mo_language2Obj, g_LanguageArr[0][l_i],g_LanguageArr[1][l_i]);
            Util_List.mf_add(this.mo_language3Obj, g_LanguageArr[0][l_i],g_LanguageArr[1][l_i]);
        };
*/
    }
}; 
var AgeList= 
{
    mo_year:null,
    mo_month:null,
    mo_day:null,
    md_selectAgeType:0,
    md_bInit:false,
    mf_init: function()
    {
        this.md_selectAgeType= g_selectAgeType & 0x1;
        this.mo_year=g_elementsArr[g_idx.age];
        this.mo_month=g_elementsArr[g_idx.age_month];
        this.mo_day  =g_elementsArr[g_idx.age_day];
        this.md_bInit=true;
    },
    mf_fillYear: function() 
    {
        if(!this.md_bInit) 
        {
            this.mf_init();
        };
        Util_List.mf_clear(this.mo_year);
        Util_List.mf_add(this.mo_year,"-","-");
        if(this.md_selectAgeType == 0) //4位年份
        {
            for(var i=g_start.getFullYear()-1;i>=g_start.getFullYear()-119;i--) 
            {
                Util_List.mf_add(this.mo_year,i,i);
            };
            //Util_List.mf_select(this.mo_year,1980);
        }else
        {
            for(var i=1;i<=119;i++) 
            {
                Util_List.mf_add(this.mo_year,i,i);
            };
            //Util_List.mf_select(this.mo_year,25); 
        };
    },
    mf_fillMonth:function() 
    {
        if(!this.md_bInit)
        {
            this.mf_init();
        }; 
        Util_List.mf_clear(this.mo_month);
        Util_List.mf_add(this.mo_month,"-","-");
        for(var i=1;i<=12;i++) 
        {
            Util_List.mf_add(this.mo_month,i,i);
        };
    }, 
    mf_fillDay: function()
    {
        if(!this.md_bInit)
        {
            this.mf_init();
        };
        var ld_last_choice=this.mo_day.value;
        var ld_year =parseInt(g_elementsArr[g_idx.age].value);
        var ld_month=parseInt(this.mo_month.options[this.mo_month.selectedIndex].value);
        Util_List.mf_clear(this.mo_day);
        Util_List.mf_add(this.mo_day,"-","-");
        if(isNaN(ld_year))
        {
            ld_year = 0;
        };
        if(isNaN(ld_month))
        {
            ld_month= 0;
        };
        if(ld_month > 0)
        for(var i=1;i<=28;i++) 
        {
            Util_List.mf_add(this.mo_day,i,i);
        };
        switch(ld_month) 
        {
            case 1:
            case 3:
            case 5:
            case 7:
            case 8:
            case 10:
            case 12: //31天
                Util_List.mf_add(this.mo_day,i,i++);
                Util_List.mf_add(this.mo_day,i,i++);
                Util_List.mf_add(this.mo_day,i,i++);
                break;
            case 2:  //闰年29天
                if(g_selectAgeType == 0)//年份
                {
                    if(ld_year==19||ld_year%400==0||(ld_year%4 == 0 && ld_year%100 != 0))
                    {
                        Util_List.mf_add(this.mo_day,i,i++);
                    };
                }
                else
                {
                    ld_year = g_start.getFullYear() - ld_year;
                    if(ld_year%400==0||(ld_year%4 == 0 && ld_year%100 != 0))
                    {
                        Util_List.mf_add(this.mo_day,i,i++);
                    };
                };
                break;
            case 4:
            case 6:
            case 9:
            case 11: //30天
                Util_List.mf_add(this.mo_day,i,i++);
                Util_List.mf_add(this.mo_day,i,i++);
                break;
        };
        Util_List.mf_select(this.mo_day,ld_last_choice);
    }
};
function f_Init()
{
    g_elementsArr=document.forms[0].elements;
    g_regform=document.forms[0];
/*    if(document.cookie=="")
    {
        alert("对不起，您禁止了Cookie的使用，将无法完成注册。\r\n请取消对于Cookie的限制后，再进行尝试。");
        return;
    };
*/
    if(navigator.userAgent.indexOf("Netscape")>-1)
    {
        document.body.onchange=function(){g_NameRandSeed[0]=6818;};
    }
    else
    {
        window.onscroll=function(){g_NameRandSeed[0]=6818;};
    };
    try{
        var l_defaultCountry=f_readCookie("AREACODE");
        if(l_defaultCountry=="") 
        {
            l_defaultCountry="1|11";
        };
        LocalList.mf_init(g_elementsArr[g_idx.country],g_elementsArr[g_idx.country],g_elementsArr[g_idx.state],g_elementsArr[g_idx.city],l_defaultCountry);
        LocalList.mf_getinfo();
        var ld_base=Math.floor(Math.random()*100)&((0x1<<g_HitCountArr.length)-1);
        for(var ld_i=0;ld_i<g_HitCountArr.length;ld_i++)
        {
            g_HitCountArr[ld_i]=(ld_base>>ld_i)&0x1;
        };
        AgeList.mf_init();
        AgeList.mf_fillYear();
        AgeList.mf_fillMonth();
        AgeList.mf_fillDay();
    }catch(e){alert("初始化过程中发生了错误！请检查您的浏览器设置，并刷新页面重试");};
    g_regform.onsubmit=function(){return false;};
    /*
    g_elementsArr[g_idx.apply_qq].onclick=function(){location.href="/";return false;};
    g_elementsArr[g_idx.apply_email].onclick=function(){location.href="http://accountadm.qq.com/signup/choice.shtml";return false;};
    */
    g_elementsArr[g_idx.nick].onfocus=function(){f_hideLayer("e_nick");this.select();};
    g_elementsArr[g_idx.nick].onblur=function(){if(this.value.length != 0){f_checknickname(this.value);};};
    g_elementsArr[g_idx.nick].onkeyup=function(){
        var ld_RealLen=0,ld_idx=0;
        for(;ld_idx<this.value.length;ld_idx++) 
        {
            ld_RealLen++;
            if(this.value.substr(ld_idx,1).charCodeAt()>0xff)
            {
                ld_RealLen++;
            };
            if(ld_RealLen>12)
            {
                this.value=this.value.substring(0,ld_idx);
                break;
            };
        };
    };
    /*
    g_elementsArr[g_idx.nick].onkeydown=function(){
        var e=window.event?window.event:arguments[0];
        var l_special_key=[8,9,35,36,37,39,46];
        log("keyCode="+e.keyCode);
        for(var i=0;i<l_special_key.length;i++){
            if(e.keyCode==l_special_key[i])
                return true;
        }
        if(this.value.replace(/[^\x00-\xff]/g,"**").length>=12)
            return false;
    };
    */
    //g_elementsArr[g_idx.nick].onkeypress=function(){f_IncHitCount(0);};
    g_elementsArr[g_idx.agetype].value=g_selectAgeType&0x1+"";
   // g_elementsArr[g_idx.age].onfocus=function(){f_hideLayer("e_age");var rng=this.createTextRange();if(g_selectAgeType==0&&this.value=="19"){rng.collapse(false);};rng.select();};
    //g_elementsArr[g_idx.age].onblur=function(){this.value=this.value.replace(/[^0-9]/g,"").substr(0,g_selectAgeType==0?4:3);f_hideLayer("e_age");};
    g_elementsArr[g_idx.age].onfocus=function(){f_hideLayer("e_age");};
    g_elementsArr[g_idx.age].onchange=function(){
        if(g_elementsArr[g_idx.age_month].value=="2")
        {
            AgeList.mf_fillDay();
        };
        f_IncHitCount(1);
    };
    //g_elementsArr[g_idx.age].onblur=function(){f_hideLayer("e_age");f_checkage();};
/*
    if(g_selectAgeType==0) 
    {
        g_elementsArr[g_idx.age].onchange=function(){
            if(g_elementsArr[g_idx.age_month].value=="2")
            {
                AgeList.mf_fillDay();
            };
            f_IncHitCount(1)};
    }else
    {
        g_elementsArr[g_idx.age].onblur=function(){f_hideLayer("e_age");if(g_selectAgeType==1&&this.value.length==0){return;};f_checkage(this.value);this.value=""+parseInt(this.value,10);
            if(g_elementsArr[g_idx.age_month].value=="2")
            {
                AgeList.mf_fillDay();
            };
        };
        g_elementsArr[g_idx.age].onkeypress=function(){f_IncHitCount(1);};
        g_elementsArr[g_idx.age].onkeyup=function(){if(this.value.length==0){return;};if(/[^0-9]/.test(this.value)){this.value=this.value.replace(/[^0-9]/g,"").substr(0,g_selectAgeType==0?4:3);};if(this.value.length!=0){f_checkage(this.value);};};
    };
*/
    g_elementsArr[g_idx.age_month].onfocus=function(){f_hideLayer("e_age");};
    g_elementsArr[g_idx.age_month].onchange=function(){AgeList.mf_fillDay();};
    //g_elementsArr[g_idx.age_month].onblur=function(){f_checkbirthday();};
    g_elementsArr[g_idx.age_day].onfocus=function(){f_hideLayer("e_age");};
    //g_elementsArr[g_idx.age_day].onblur=function(){f_checkbirthday();};
    g_elementsArr[g_idx.gentle_male].onclick = function(){g_elementsArr[g_idx.gentle_male].value="1";};
    g_elementsArr[g_idx.gentle_female].onclick = function(){g_elementsArr[g_idx.gentle_male].value="2";};
    g_elementsArr[g_idx.pass].onpaste=function(){return false;};
    g_elementsArr[g_idx.pass].onfocus=function(){f_hideLayer("e_pass");g_NameRandSeed[3]=2252;this.select();if(this.value.length!=0){f_checkrank(this,this.value);};};
    g_elementsArr[g_idx.pass].onblur=function(){f_hideLayer("otherClew");if(this.value.length==0){return;};f_checkpwd(this.value);};
    g_elementsArr[g_idx.pass].onkeydown=function(){f_IncHitCount(2);if(g_elementsArr[g_idx.repass].value.length!=0&&g_elementsArr[g_idx.pass].value.length==0){g_elementsArr[g_idx.repass].value="";};};
    g_elementsArr[g_idx.pass].onkeyup=function(){f_checkrank(this,this.value)};
    g_elementsArr[g_idx.repass].onpaste=function(){return false;};
    g_elementsArr[g_idx.repass].onfocus=function(){f_hideLayer("e_repass");if(g_elementsArr[g_idx.pass].value.length==0){this.value="";};this.select();};
    g_elementsArr[g_idx.repass].onblur=function(){f_hideLayer("e_repass");if(this.value.length==0){return;};if(f_checkrepwd(this.value)){f_equalpass(this,g_elementsArr[g_idx.pass]);}; g_NameRandSeed[2]=5123;};
    g_elementsArr[g_idx.repass].onkeypress=function(){f_IncHitCount(3);}; 
    g_elementsArr[g_idx.repass].onkeyup=function(){f_partequalpass(this.value,g_elementsArr[g_idx.pass].value)};
    g_elementsArr[g_idx.country].onchange=function(){LocalList.mf_processStateList();};
    g_elementsArr[g_idx.state].onchange=function(){LocalList.mf_processCityList();};
    g_elementsArr[g_idx.validecode].onpaste=function(){return false;};
    g_elementsArr[g_idx.validecode].onfocus=function(){f_hideLayer("e_validecode");if(this.value=='请输入您在下图中看到的字符，不区分大小写'){this.value='';};this.style.color='black';this.maxLength='8';this.select();};
    g_elementsArr[g_idx.validecode].onblur=function(){if(this.value==''){this.style.color='#808080';this.maxLength='32';this.value='请输入您在下图中看到的字符，不区分大小写';}else{this.style.color='black';this.maxLength='4';f_checkvalidcode(this.value);};};
    g_elementsArr[g_idx.validecode].onkeyup=function(){var e=window.event?window.event:arguments[0];if(e.keyCode==13){f_CheckInfo(this);}; };
    var ld_idx=g_input_box[Math.round(Math.random()*1000)%g_input_box.length];
    //log("ld_idx="+ld_idx);
    g_elementsArr[ld_idx].onkeydown=function(){if(g_bCheckConn){return;};g_bCheckConn=true;f_getdata_checkconn("/cgi-bin/checkconn?seed"+Math.random());g_NameRandSeed[1]=8315;}; /*考虑再加timer限制*/ 
    $('vfcode').onclick=f_RefreshValidcode;
    $('vfcode_a').onclick=f_RefreshValidcode;
    f_RefreshValidcode_Only();
    $('a_submit').onclick = f_CheckInfo;
    f_hideLayer("loading");
    f_showLayer("load_complete");
    g_elementsArr[g_idx.nick].focus();
    //g_start = new Date();
    //setTimeout("f_ReSelect()",500); 
};
function f_ReSelect() 
{
    Util_List.mf_select(g_elementsArr[g_idx.country],LocalList.md_defaultCountry);
    Util_List.mf_select(g_elementsArr[g_idx.state],LocalList.md_defaultState);
    Util_List.mf_select(g_elementsArr[g_idx.city],LocalList.md_defaultCity);
}
function f_UpdateData()
{
    g_elementsArr[2].blur();
    //g_elementsArr[4].blur(); //age不blur，否则会引发mf_fillDay
    g_elementsArr[8].blur();
    g_elementsArr[9].blur();
    g_elementsArr[12].blur();
/*
    g_elementsArr[0].blur();
    g_elementsArr[1].blur();
    g_elementsArr[4].blur();
    g_elementsArr[5].blur();
    g_elementsArr[8].blur();
    g_elementsArr[9].blur();
    g_elementsArr[13].blur();
    g_elementsArr[15].blur();
    g_elementsArr[17].blur();
    g_elementsArr[18].blur();
    g_elementsArr[19].blur();
    g_elementsArr[20].blur();
    g_elementsArr[22].blur();
    g_elementsArr[23].blur();
*/
};
/*
var g_promptText=["格式：2-16位阿拉伯数字", "格式：1-19位中文或者2-38位英文", "格式：YYYYMMDD，例如20050705"];
var g_TitleArr=["标题","昵称","年龄","密码","重新输入密码","国家","省份","城市","问题1","答案1","问题2","答案2","问题3","答案3","安全邮件地址","手机号码","真实姓名","证件类型","证件号码","验证码","相关服务条款"];
var g_KeyOuterSplit='&';
var g_KeyInnerSplit='@';
var g_voidQuestionName="请选择提示问题";
*/
/**********************/
var g_HaveCheckAll=false;
/*
var Util_ErrMap=
{
    mf_FindFromErrMap: function(l_groupID)
    {
        var l_kids=$(g_IdArray[50]).childNodes;
        for(var ld_i=0,ld_len=l_kids.length;ld_i<ld_len;ld_i++)
        {
            if(l_kids[ld_i].getAttribute("groupId")>=l_groupID)
            {
                return l_kids[ld_i];
            };
        };
        return null;
    },
    mf_InitErrMap: function()
    {
        var l_err_map_obj=$(g_IdArray[50]);
        l_err_map_obj.innerHTML="";
        var l_li=document.createElement("LI");
        l_li.appendChild(document.createTextNode("请您完善以下信息："));
        l_li.className="title";
        l_li.setAttribute("groupId",0);
        l_err_map_obj.appendChild(l_li);
    },
    mf_AddToErrMap: function(l_JmpPos,l_ItemTitle,l_ItemContent)
    {
        if(!g_HaveCheckAll)
        {
            return;
        };
        var l_err_map_obj=$(g_IdArray[50]);
        var l_GroupID=this.mf_IndexFromTitle(l_ItemTitle);
        if(l_GroupID==-1)
        {
            return;
        };
        if(l_err_map_obj.childNodes.length<1)
        {
            this.mf_InitErrMap(l_err_map_obj);
        };
        var l_li=document.createElement("LI");
        l_li.innerHTML="<a href='#"+l_JmpPos+"'>"+l_ItemTitle+"</a>"+l_ItemContent;
        l_li.setAttribute("groupId",l_GroupID);
        var l_obj=this.mf_FindFromErrMap(l_GroupID);
        if(l_obj==null)
        {
            l_err_map_obj.appendChild(l_li);
        }
        else
        {
            if(l_obj.getAttribute("groupId")==l_GroupID)
            {
                if(l_li.innerHTML!=l_obj.innerHTML)
                {
                    l_err_map_obj.replaceChild(l_li,l_obj);
                };
            }
            else
            {
                l_err_map_obj.insertBefore(l_li,l_obj);
            };
        };
        if(l_err_map_obj.childNodes.length<=1)
        {
            l_err_map_obj.innerHTML="";
            f_hideLayer($(g_IdArray[49]));
        }
        else
        {
            f_showLayer($(g_IdArray[49]));
        };
    },
    mf_IndexFromTitle: function(l_ItemTitle)
    {
        var l_len=g_TitleArr.length;
        for(var ld_i=0;ld_i<l_len;ld_i++)
        {
            if(g_TitleArr[ld_i]==l_ItemTitle)
            {
                return ld_i;
            };
        };
        return -1;
    },
    mf_DelFromErrMap: function(l_ItemTitle)
    {
        if(!g_HaveCheckAll)
        {
            return;
        };
        var l_GroupID=this.mf_IndexFromTitle(l_ItemTitle);
        if(l_GroupID==-1)
        {
            return;
        };
        var l_err_map_obj=$(g_IdArray[50]);
        var l_kids=l_err_map_obj.childNodes;
        var l_obj;
        for(var ld_i=0;ld_i<l_kids.length;ld_i++)
        {
            l_obj=l_kids[ld_i];
            if(l_obj.getAttribute("groupId",0)==l_GroupID)
            {
                l_err_map_obj.removeChild(l_obj);
                break;
            };
        };
        if(l_err_map_obj.childNodes.length<=1)
        {
            l_err_map_obj.innerHTML="";
            f_hideLayer($(g_IdArray[49]));
        };
    }
};
*/
/**********************/
/* some thing from original js */
function getPos(obj)
{
	var pos = {};
	pos.X = obj.offsetLeft;
	pos.Y = obj.offsetTop;
	while (obj = obj.offsetParent)
	{
		pos.X += obj.offsetLeft;
		pos.Y += obj.offsetTop;
	}
	return pos;
}
function showError(targetPos,content)
{
	var obj = $("errorClew");
	obj.innerHTML = content;
	var pos = getPos(targetPos);
	obj.style.left = pos.X + 300 + "px";
	obj.style.top = pos.Y + 4 + "px";
	obj.style.display = "block";
}
function showPwRank(targetPos,pwRank)
{
	var obj = $("passwordClew");
	switch(pwRank)
        {
            case 0:
                break;
            case 1:
                obj.innerHTML = "密码强度：低";
                obj.className = "password rankLow";
                break;
            case 2:
                obj.innerHTML = "密码强度：中";
                obj.className = "password rankMiddle";
                break;
            case 3:
                obj.innerHTML = "密码强度：高";
                obj.className = "password rankHigh";
                break;
        }
	var pos = getPos(targetPos);
	obj = obj.parentNode;
	obj.style.left = pos.X + 300 + "px";
	obj.style.top = pos.Y + 4 + "px";
	obj.style.display = (pwRank?"block":"none");
}
function f_showLayer(ld_LayerId)
{
    $(ld_LayerId).style.display="block";
};
function f_hideLayer(ld_LayerId)
{
    $(ld_LayerId).style.display="none";
};
function f_showInfoInLayer(lo_LayerObj,l_Content)
{
    lo_LayerObj.innerHTML=l_Content;
    if(l_Content!="")
    {
        lo_LayerObj.style.display="block";
    }
    else
    {
        lo_LayerObj.style.display="none";
    };
};
function f_ChangeDivStyle(l_divId,l_bBold)
{
    if(l_bBold)
    {
        $(l_divId).style.fontWeight="bold";
        $(l_divId).style.color="red";
    }
    else
    {
        $(l_divId).style.fontWeight="normal";
        $(l_divId).style.color="black";
    };
};
function f_RefreshValidcode_Only() 
{
    //$("vfcode").src="http://freeqq3.qq.com/getimage?"+Math.random();
	$("vfcode").src="http://ui.ptlogin2.qq.com/cgi-bin/getimage?aid=1000801&"+Math.random();
}
function f_RefreshValidcode()
{
    try{
        f_RefreshValidcode_Only();
        //changeimg(); //调web中的函数
        g_elementsArr[g_idx.validecode].value="";
        g_elementsArr[g_idx.validecode].focus();
        f_att(54794);
    }catch(l_e){
    };
};
function f_isAllDigit(ld_content)
{
    for(var ld_i=0;ld_i<ld_content.length;ld_i++)
    {
        var l_ch=ld_content.charAt(ld_i);
        if((l_ch<'0')||(l_ch>'9'))
        {
            return false;
        };
    };
    return true;
};
function f_checkNumber(ld_content)
{
    if(ld_content.length<2)
    {
        return false;
    };
    return f_isAllDigit(ld_content);
};
function f_checkDate(ld_content)
{
    if(ld_content.length!=8)
    {
        return false;
    };
    if(f_isAllDigit(ld_content)==false)
    {
        return false;
    };
    var l_year=parseInt(ld_content.substr(0,4),10);
    var l_month=parseInt(ld_content.substr(4,2),10);
    var l_mday=parseInt(ld_content.substr(6,2),10);
    if((l_year<1900)||(l_year>2100))
    {
        return false;
    };
    if((l_month<1)||(l_month>12))
    {
        return false;
    };
    if((l_mday<1)||(l_mday>31))
    {
        return false;
    };
    return true;
};
function f_IsEmailAddress(ld_content)
{
    if(ld_content.length<3)
    {
        return false;
    };
    if(ld_content.search(/^[\._0-9A-Za-z\-]+@([0-9A-Za-z\-]+\.)+[A-Za-z]{2,3}$/)<0)
    {
        return false;
    };
    if((ld_content.search(/^[^@]+@qq.com$/)>=0)&&(ld_content.length>=41))
    {
        return false;
    };
    return true;
};
function f_IsPhoneNumber(ld_content)
{
    if(ld_content.length!=11)
    {
        return false;
    };
    if(ld_content.search(/^(13|15)[0-9]{9}$/)<0)
    {
        return false;
    };
    return true;
};
function f_IsName(ld_content)
{
    if(ld_content.length<=0)
    {
        return false;
    };
    var l_reg=/^([\u4e00-\u9fa5]{1,19}|[A-Za-z ]{2,38})$/;
    return l_reg.test(ld_content);
};
function f_IsPersonalCard(ld_content)
{
    var l_isIDCard1=new Object();
    var l_isIDCard2=new Object();
    l_isIDCard1=/^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$/;
    l_isIDCard2=/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}[0-9Xx]{1}$/;
    if((l_isIDCard1.test(ld_content))||(l_isIDCard2.test(ld_content)))
    {
        return true;
    };
    return false;
};
function f_IsCertNo(ld_content,ld_type)
{
    var l_reg=/^([A-Za-z0-9])+$/;
    if(ld_content.length<=0)
    {
        return false;
    };
    if(l_reg.test(ld_content)==false)
    {
        return false;
    };
    if(ld_type==1)
    {
        return f_IsPersonalCard(ld_content);
    }
    else
    {
        return true;
    };
};
function f_showMore(lo_switchObj,ld_LayerId)
{
    var lo_LayerObj=$(ld_LayerId);
    if(lo_LayerObj.style.display=="none")
    {
        lo_switchObj.className="title2";
        lo_LayerObj.style.display="block";
    }
    else
    {
        lo_switchObj.className="title1";
        lo_LayerObj.style.display="none";
    };
};
function f_checknickname(l_Content)
{
    var lo_LayerObj=$("e_nick");
    if(l_Content.length==0)
    {
//        f_ChangeDivStyle(g_IdArray[0],true);
        f_showInfoInLayer(lo_LayerObj,"您还未输入昵称");
//        Util_ErrMap.mf_AddToErrMap(g_IdArray[39],"昵称","请输入您的昵称");
        return false;
    };
    var l_zhChArr=l_Content.replace(/[^\x00-\xff]/g,"**");
    var l_len=l_zhChArr.length;
    if(l_len>12)
    {
//        f_ChangeDivStyle(g_IdArray[0],true);
        f_showInfoInLayer(lo_LayerObj,"最多输入12个英文或6个中文字符");
//        Util_ErrMap.mf_AddToErrMap(g_IdArray[39],"昵称","昵称必须为1-12个字符，中文字符算2个");
        return false;
    }
    else
    {
        f_showInfoInLayer(lo_LayerObj,"");
//        f_ChangeDivStyle(g_IdArray[0],false);
//        Util_ErrMap.mf_DelFromErrMap("昵称");
        return true;
    };
};
function f_checkbirthday() 
{
    var lo_LayerObj=$("e_age");
    var lo_Month=g_elementsArr[g_idx.age_month];
    var lo_Day  =g_elementsArr[g_idx.age_day];
    if(lo_Month.value=="-" || lo_Day.value=="-") 
    {
        f_showInfoInLayer(lo_LayerObj,"您的生日项还未选择完整");
        return false;
    }else
    {
        return true;
    };
};
function f_checkage(l_Content)
{
    var lo_LayerObj=$("e_age");
    var lo_Year=g_elementsArr[g_idx.age];
    if(lo_Year.value=="-") 
    {
        switch(g_selectAgeType & 0x1) 
        {
            case 0:
                f_showInfoInLayer(lo_LayerObj,"您还未选择生日");
                break;
            case 1:
                f_showInfoInLayer(lo_LayerObj,"您还未选择年龄");
                break;
        }
        return false;
    }else
    {
        f_showInfoInLayer(lo_LayerObj,"");
        return true;
    }
    switch(g_selectAgeType & 0x1) 
    {
        case 0: //生日
        {
            return true;
            /*
            if(l_Content == "19") 
            {
                //f_hideLayer("e_age");
                f_showInfoInLayer(lo_LayerObj,"您还未输入生日");
                return false;
            };
            if(l_Content.length != 4) 
            {
                f_hideLayer("e_age");
                return;
            };
            */
            var ld_year = parseInt(l_Content);
            if(isNaN(ld_year) ||ld_year > g_start.getFullYear() ||
                    ld_year <g_start.getFullYear()-119) 
            {
                f_showInfoInLayer(lo_LayerObj,"生日必须为"+(g_start.getFullYear()-119)+"-"+g_start.getFullYear()+"之间的整数");
                return false;
            }
            else
            {
                f_showInfoInLayer(lo_LayerObj,"");
                return true;
            };
            break;
        };
        case 1: //年龄
        {
            if(l_Content.length==0)
            {
                //f_hideLayer("e_age");
                f_showInfoInLayer(lo_LayerObj,"您还未输入年龄");
                return false;
            }; 
            if((-1==l_Content.search(/^[0-9]+$/))||(Number(l_Content)>119)||(Number(l_Content)<=0))
            {
                f_showInfoInLayer(lo_LayerObj,"年龄必须为1-119之间的整数");
                return false;
            }
            else
            {
                f_showInfoInLayer(lo_LayerObj,"");
                return true;
            };
            break;
        };
        default: return false;
    };
};
/*
function f_checkpwd(l_Content)
{
    var lo_LayerObj=$(g_IdArray[5]);
    if(l_Content.indexOf(' ')>=0)
    {
        f_ChangeDivStyle(g_IdArray[4],true);
        f_showInfoInLayer(lo_LayerObj,"密码中不能含有空格字符");
        f_showLayer(g_IdArray[6]);
        f_hideLayer(g_IdArray[7]);
        Util_ErrMap.mf_AddToErrMap(g_IdArray[40],"密码","密码中不能含有空格字符");
        return false;
    }
    else if((l_Content.length<6)||(l_Content.length>16))
    {
        if (l_Content.length==0)
        {
            f_ChangeDivStyle(g_IdArray[4],true);
            f_showInfoInLayer(lo_LayerObj,"请输入您的密码");
            f_showLayer(g_IdArray[6]);
            f_hideLayer(g_IdArray[7]);
            Util_ErrMap.mf_AddToErrMap(g_IdArray[40],"密码","请输入您的密码");
            return false;
        }
        else
        {
            f_ChangeDivStyle(g_IdArray[4],true);
            f_showInfoInLayer(lo_LayerObj,"");
            f_hideLayer(g_IdArray[6]);
            f_showLayer(g_IdArray[7]);
            Util_ErrMap.mf_AddToErrMap(g_IdArray[40],"密码","密码长度应该在6-16位之间");
        };
        return false;
    }   
    else
    {
        f_getdata_pwd("/checkvalid?password="+encodeURIComponent(g_elementsArr[4].value)+"&seed="+Math.random(),true);
        return true;
    };
};
*/
function f_checkpwd(l_Content,lb_need_svr) 
{
    var lo_LayerObj=$("e_pass");
    if(l_Content.indexOf(' ') >= 0) 
    {
        f_showInfoInLayer(lo_LayerObj,"密码中不能含有空格字符");
        return false;
    };
    if(l_Content.length == 0) 
    {
        f_showInfoInLayer(lo_LayerObj,"您还没有输入密码");
        return false;
    }
    else if(l_Content.length<6) 
    {
        f_showInfoInLayer(lo_LayerObj,"您输入的密码过短");
        return false;
    }
    else if(l_Content.length>16) 
    {
        f_showInfoInLayer(lo_LayerObj,"您输入的密码过长");
        return false;
    };
    if(l_Content.length<9 && !l_Content.match(/[^0-9]/))
    {
        f_showInfoInLayer(lo_LayerObj,"密码不能为9位以下纯数字");
        return false;
    }
    if(lb_need_svr)
        f_getdata_pwd("/cgi-bin/checkvalid?password="+encodeURIComponent(g_elementsArr[g_idx.pass].value)+"&seed="+Math.random(),true);
    return true;
};
function f_CalcPwdRank(l_Content) 
{
    var ls = 0; 
    if (l_Content.match(/[a-z]/g)){ ls++; }
    if(l_Content.match(/[A-Z]/g)){ ls++; }
    if (l_Content.match(/[0-9]/g)){ ls++; }
    if (l_Content.match(/[^a-zA-Z0-9]/g)){ ls++; }
    if (l_Content.length < 8 && ls > 1){   
        ls = 1;
    } 
    if(ls>3) 
    {
        ls=3;
    };
    return ls;
};
function f_checkrank(obj,l_Content) //符合强度后返回true
{
    if(l_Content.length<6||/^[0-9]{1,8}$/.test(l_Content)) {showPwRank(obj,0);return 0;}
    var ls=f_CalcPwdRank(l_Content);
    /*
    if(l_Content.length < 6 && ls == 1){
        ls = 0;
    }	
    */
    switch(ls) { 
        case 0:    //不显示
        case 1:    //弱
        case 2:    //中
        case 3:    //强 
            showPwRank(obj,ls);
            break;
        default:
            showPwRank(obj,3);
    }
    return ls;
};
function f_checkrepwd(l_Content)
{
    var lo_LayerObj=$("e_repass");
    if(l_Content.length==0)
    {
        //f_ChangeDivStyle(g_IdArray[8],true);
        f_showInfoInLayer(lo_LayerObj,"请再次输入您的密码");
        //Util_ErrMap.mf_AddToErrMap(g_IdArray[40],"重新输入密码","请再次输入您的密码");
        return false;
    }
    else
    {
        f_showInfoInLayer(lo_LayerObj,"");
        //f_ChangeDivStyle(g_IdArray[8],false);
        //Util_ErrMap.mf_DelFromErrMap("重新输入密码");
        return true;
    };
};
//1:repass,2:pass
function f_partequalpass(l_pass1,l_pass2) 
{
    var lo_LayerObj = $("e_repass");
    if(l_pass2.indexOf(l_pass1)!=0) 
    {
        f_showInfoInLayer(lo_LayerObj,"密码和确认密码输入不一致");
        return false;
    }
    else
    {
        f_showInfoInLayer(lo_LayerObj,"");
        return true;
    };
};
function f_equalpass(l_pass1,l_pass2)
{
    var lo_LayerObj=$("e_repass");
    if((l_pass1.value.length!=0)&&(l_pass2.value.length!=0))
    {
        if(l_pass1.value!=l_pass2.value)
        {
            //f_ChangeDivStyle(g_IdArray[8],true);
            f_showInfoInLayer(lo_LayerObj,"密码和确认密码输入不一致");
            //Util_ErrMap.mf_AddToErrMap(g_IdArray[40],"重新输入密码","密码和重复密码输入不一致");
            return false;
        };
    };
    if(l_pass2.value.length!=0)
    {
        f_showInfoInLayer(lo_LayerObj,"");
        //f_ChangeDivStyle(g_IdArray[8],false);
        //Util_ErrMap.mf_DelFromErrMap("重新输入密码");
    };
    return true;
};
function f_checkvalidcode1(l_Content)
{
    var lo_LayerObj=$("e_validecode");
    if((l_Content.length==0)||(l_Content=="请输入您在上图中看到的字符，不区分大小写"))
    {
        //f_ChangeDivStyle(g_IdArray[35],true);
        f_showInfoInLayer(lo_LayerObj,"请输入验证码");
        //Util_ErrMap.mf_AddToErrMap(g_IdArray[41],"验证码","请输入验证码");
        return false;
    };
   // if((l_Content.length<6)||(l_Content.length>8))
	if(l_Content.length != 4)
    {
        //f_ChangeDivStyle(g_IdArray[35],true);
        f_showInfoInLayer(lo_LayerObj,"字符个数不正确");
        //Util_ErrMap.mf_AddToErrMap(g_IdArray[41],"验证码","字符个数不正确");
        return false;
    }
    else
    {
		 f_showInfoInLayer(lo_LayerObj,"");
      //  f_getdata_valid("/checkvalid?validcode="+encodeURIComponent(l_Content)+"&seed="+Math.random(),false);
        return true;
    };
};
function f_checkvalidcode(l_Content)
{
    var lo_LayerObj=$("e_validecode");
    if((l_Content.length==0)||(l_Content=="请输入您在上图中看到的字符，不区分大小写"))
    {
        //f_ChangeDivStyle(g_IdArray[35],true);
        f_showInfoInLayer(lo_LayerObj,"请输入验证码");
        //Util_ErrMap.mf_AddToErrMap(g_IdArray[41],"验证码","请输入验证码");
        return false;
    };
   // if((l_Content.length<6)||(l_Content.length>8))
	if(l_Content.length != 4)
    {
        //f_ChangeDivStyle(g_IdArray[35],true);
        f_showInfoInLayer(lo_LayerObj,"字符个数不正确");
        //Util_ErrMap.mf_AddToErrMap(g_IdArray[41],"验证码","字符个数不正确");
        return false;
    }
    else
    {
        f_showInfoInLayer(lo_LayerObj,""); 
        //f_getdata_valid("/cgi-bin/checkvalid?validcode="+encodeURIComponent(l_Content)+"&seed="+Math.random(),false);
        return true;
    };
};
function f_checkagree(l_agreeObj)
{
    if(!l_agreeObj.checked)
    {
        Util_ErrMap.mf_AddToErrMap(g_IdArray[42],"相关服务条款","您需要阅读并且认可我们的服务条款，才能够使用我们的服务");
        return false;
    }
    else
    {
        Util_ErrMap.mf_DelFromErrMap("相关服务条款");
        return true;
    };
};
function f_CheckInfo()
{
    g_NameRandSeed[0]=6818;
    f_UpdateData();
    g_HaveCheckAll=true;
    //Util_ErrMap.mf_InitErrMap();
/*
    if(g_elementsArr[6].value==0)
    {
        g_elementsArr[9].value="中华人民共和国";
        g_elementsArr[10].value="";
        g_elementsArr[11].value="";
        if((g_elementsArr[7].value.length!=0)&&(g_elementsArr[7].value!="请选择"))
        {
            g_elementsArr[10].value=g_elementsArr[7].value;
            if(g_elementsArr[8].value!="请选择")
            {
                g_elementsArr[11].value=g_elementsArr[8].value;
            };
        };
    };
//*/
    var ld_bError=false;
    if(!f_checknickname(g_elementsArr[g_idx.nick].value))
    {
        ld_bError=true;
        f_att(54798);
    };
    if(!f_checkage(g_elementsArr[g_idx.age].value))
    {
        ld_bError=true;
        if(g_selectAgeType==0)
        {
            f_att(54799);
        }else
        {
            f_att(55126);
        };
    }
    else if(!f_checkbirthday())
    {
        ld_bError=true;
    };
    if(!f_checkpwd(g_elementsArr[g_idx.pass].value))
    {
        f_checkrepwd(g_elementsArr[g_idx.repass].value);
        ld_bError=true;
        f_att(54800);
    }
    else
    {
        if((!f_checkrepwd(g_elementsArr[g_idx.repass].value))||(!f_equalpass(g_elementsArr[g_idx.pass],g_elementsArr[g_idx.repass])))
        {
            ld_bError=true;
            f_att(54801);
        };
    };
  
    if(!f_checkvalidcode(g_elementsArr[g_idx.validecode].value))
    {
        ld_bError=true;      
        f_att(54804);
    };

    if(ld_bError||(g_pwdCheckStatus&0x20)||(g_validCheckStatus&0x20))
    {
        //$(g_IdArray[49]).style.display="block";
        //location.href=g_IdArray[43];
    }
    else
    {
        //$(g_IdArray[49]).style.display="none";
        //$(g_IdArray[50]).innerHTML="";
        var rank=f_CalcPwdRank(g_elementsArr[g_idx.pass].value); 
        switch(rank) 
        {
            case 1:
                f_att(54795);
                break;
            case 2:
                f_att(54796);
                break;
            case 3:
                f_att(54797);
                break;
        }
        f_ReadyToSubmit();
    };
};
//gd_msxml_progid=["MSXML2.XMLHTTP.5.0","MSXML2.XMLHTTP.4.0","MSXML2.XMLHTTP.3.0","MSXML2.XMLHTTP","Microsoft.XMLHTTP"];
gd_msxml_progid=["MSXML2.XMLHTTP.4.0","MSXML2.XMLHTTP.3.0","MSXML2.XMLHTTP","Microsoft.XMLHTTP"];
function f_createxmlhttp()
{
    var lo_http=null;
    try
    {
        lo_http=new XMLHttpRequest();
    }
    catch(e)
    {
        for(var i=0,ld_len=gd_msxml_progid.length;i<ld_len;++i)
        {
            try
            {
                lo_http=new ActiveXObject(gd_msxml_progid[i]);
                gd_msxml_progid=[gd_msxml_progid[i]];
                break;
            }
            catch(e){lo_http=null;};
        };
    }
    finally
    {
        return lo_http;
    };
};
var g_pwdCheckStatus=0;
function f_processPwd()
{
    if(g_http_request_pwd.readyState==4)
    {
        if(g_http_request_pwd.status==200)
        {
            g_pwdCheckStatus=parseInt(g_http_request_pwd.responseText,10);
        }
        else
        {
            g_pwdCheckStatus=0x80;
        };
        var l_promptErr="";
        var l_pwdErrObj=$("e_pass");
        if(g_pwdCheckStatus&0x20)
        {
            if(g_pwdCheckStatus&0x01)
            {
                l_promptErr="密码过于简单，请重新设置";
            }
            else
            {
                l_promptErr="密码不能为9位以下的纯数字";
            };
            //f_ChangeDivStyle(g_IdArray[4],true);
            f_showInfoInLayer(l_pwdErrObj,l_promptErr);
            //f_hideLayer(g_IdArray[6]);
            //f_showLayer(g_IdArray[7]);
            //Util_ErrMap.mf_AddToErrMap(g_IdArray[40],"密码",l_promptErr);
        }
        else
        {
            f_showInfoInLayer(l_pwdErrObj,"");
            //f_showLayer(g_IdArray[6]);
            //f_hideLayer(g_IdArray[7]);
            //f_ChangeDivStyle(g_IdArray[4],false);
            //Util_ErrMap.mf_DelFromErrMap("密码");
        };
    };
};
var g_validCheckStatus=0;
function f_processValid()
{
    if(g_http_request_valid.readyState==4)
    {
        if(g_http_request_valid.status==200)
        {
            g_validCheckStatus=parseInt(g_http_request_valid.responseText,10);
        }
        else
        {
            g_validCheckStatus=0x40;
        };
        var l_promptErr="";
        var l_validErrObj=$("e_validecode");
        if(g_validCheckStatus & 0x20)
        {
            if(g_validCheckStatus&0x01)
            {
                l_promptErr="验证码已失效，请重新输入";
                f_RefreshValidcode();
            }
            else
            {
                l_promptErr="验证码输入不正确";
            };
            //f_ChangeDivStyle(g_IdArray[35],true);
            f_showInfoInLayer(l_validErrObj,l_promptErr);
            //Util_ErrMap.mf_AddToErrMap(g_IdArray[41],"验证码",l_promptErr);
        }
        else
        {
            f_showInfoInLayer(l_validErrObj,"");
            //f_ChangeDivStyle(g_IdArray[35],false);
            //Util_ErrMap.mf_DelFromErrMap("验证码");
        };
    };
};
var g_http_request_pwd=false;
var g_http_request_valid=false;
var g_http_request_checkconn=false;
var g_http_request_form=false;
var g_http_request_att=false;
function f_att(typeId)
{
    var ld_url="/cgi-bin/srv_tj?type="+String(typeId)+"&seed="+Math.random();
    if(!g_http_request_att)
    {
        g_http_request_att=XmlHttp.mf_createxmlhttp();
    };
    if(g_http_request_att)
    {
        try{
            XmlHttp.mf_sendrequest_sync(g_http_request_att,ld_url);
        }catch(e){};
    };
};
function f_getdata_pwd(l_url)
{
    g_pwdCheckStatus=0;
    g_http_request_pwd=f_createxmlhttp();
    if(!g_http_request_pwd)
    {
        var l_pwdErrObj=$("e_pass");
        l_pwdErrObj.innerHTML="";
        l_pwdErrObj.style.display="none";
        //f_showLayer(g_IdArray[6]);
        //f_hideLayer(g_IdArray[7]);
        //f_ChangeDivStyle(g_IdArray[4],false);
        //Util_ErrMap.mf_DelFromErrMap("密码");
        return;
    };
    g_http_request_pwd.onreadystatechange=f_processPwd;
    g_http_request_pwd.open("GET",l_url,true);
    g_http_request_pwd.send(null);
};
function f_getdata_valid(l_url)
{
    g_validCheckStatus=0;
    g_http_request_valid=f_createxmlhttp();
    if(!g_http_request_valid)
    {
        var l_validErrObj=$("e_validecode");
        l_validErrObj.innerHTML="";
        //f_ChangeDivStyle(g_IdArray[35],false);
        //Util_ErrMap.mf_DelFromErrMap("验证码");
        return;
    };
    g_http_request_valid.onreadystatechange=f_processValid;
    g_http_request_valid.open("GET",l_url,true);
    g_http_request_valid.send(null);
};
function f_getdata_checkconn(l_url)
{
	g_http_request_checkconn=f_createxmlhttp();
    if(!g_http_request_checkconn)
    {
        return;
    };
    g_http_request_checkconn.onreadystatechange=f_processCheckconn;
    g_http_request_checkconn.open("GET",l_url,true);
    g_http_request_checkconn.send(null);
}
var EV=eval;
function f_processCheckconn()
{
	if((g_http_request_checkconn.readyState==4)&&(g_http_request_checkconn.status==200))
    {
        try
        {
            EV(g_http_request_checkconn.responseText);
			g_http_request_checkconn.abort();
        }
        catch(e)
        {
        };
    };
}
var g_TestCount=0;
function f_ReadyToSubmit()
{
    f_WriteHitCookie();
    g_TestCount=0;
    f_AdjustForm();
    setTimeout("f_IsSubmit();",200);
};
function f_IsSubmit()
{
    if(((g_pwdCheckStatus&0x20)!=0)||((g_validCheckStatus&0x20)!=0))
    {
        return false;
    };
    if((g_pwdCheckStatus==0)||(g_validCheckStatus==0))
    {
        g_TestCount++;
        if(g_TestCount<5)
        {
            setTimeout("f_IsSubmit();",200);
            return false;
        };
    };
    f_postdata(g_regform.action, f_processPost);
    return true;
};
function f_OnCardSelectChanged()
{
    f_checkCardNo(g_elementsArr[22],g_elementsArr[20]);
};
function f_checkName(lo_nameObj,lo_certObj)
{
    var lo_LayerObj=$(g_IdArray[32]);
    if(lo_nameObj.value.length!=0)
    {
        var ld_bError=false;
        if(!f_IsName(lo_nameObj.value))
        {
            f_ChangeDivStyle(g_IdArray[31],true);
            f_showInfoInLayer(lo_LayerObj,"姓名格式不正确");
            Util_ErrMap.mf_AddToErrMap(g_IdArray[46],"真实姓名","姓名格式不正确");
            ld_bError=true;
        };
        if(lo_certObj.value.length==0)
        {
            f_ChangeDivStyle(g_IdArray[33],true);
            f_showInfoInLayer($(g_IdArray[34]),"姓名和证件号码必须同时输入");
            Util_ErrMap.mf_AddToErrMap(g_IdArray[46],"证件号码","姓名和证件号码必须同时输入");
        };
        if(ld_bError)
        {
            return false;
        };
    }
    else if(lo_certObj.value.length!=0)
    {
        f_ChangeDivStyle(g_IdArray[31],true);
        f_showInfoInLayer(lo_LayerObj,"姓名和证件号码必须同时输入");
        Util_ErrMap.mf_AddToErrMap(g_IdArray[46],"真实姓名","姓名和证件号码必须同时输入");
        return false;
    }
    else
    {
        $(g_IdArray[30]).style.display="none";
        f_hideLayer(g_IdArray[34]);
        f_ChangeDivStyle(g_IdArray[33],false);
        Util_ErrMap.mf_DelFromErrMap("证件号码");
    };
    f_hideLayer(g_IdArray[32]);
    f_ChangeDivStyle(g_IdArray[31],false);
    Util_ErrMap.mf_DelFromErrMap("真实姓名");
    return true;
};
function f_checkInputByType(ld_checkTypeNo,ld_content)
{
    switch(parseInt(ld_checkTypeNo,10))
    {
        case 0:
        {
            return f_checkNumber(ld_content);
        };
        case 1:
        {
            return f_IsName(ld_content);
        };
        case 2:
        {
            return f_checkDate(ld_content);
        };
        default:
        {
            return false;
        };
    };
    return false;
};
function f_GetCurIndex(ld_baseIndex,lo_curObj)
{
    var ld_curIndex=-1;
    for(var ld_i=0;ld_i<3;ld_i++)
    {
        if(lo_curObj==g_elementsArr[ld_baseIndex+2*ld_i])
        {
            ld_curIndex=ld_i;
            break;
        };
    };
    return ld_curIndex;
};
/*
function f_SelectionChanged(lo_selectCtrl)
{
    var ld_arySelectedValues=f_getSelectedValues();
    var ld_i,lo_ctrl,ld_key;
    var ld_allKeys=f_getKeys();
    var ld_curindex=f_GetCurIndex(12,lo_selectCtrl);
    if(ld_curindex==-1)
    {
        return;
    };
    var lo_errobj=$(g_IdArray[22]+ld_curindex);
    if(0!=lo_selectCtrl.selectedIndex)
    {
        lo_errobj.style.display="none";
        f_ChangeDivStyle((g_IdArray[21]+ld_curindex),false);
        Util_ErrMap.mf_DelFromErrMap(("问题"+(ld_curindex+1)));
    }
    else
    {
        lo_errobj.style.display="block";
        f_ChangeDivStyle((g_IdArray[21]+ld_curindex),true);
        Util_ErrMap.mf_AddToErrMap(g_IdArray[47],("问题"+(ld_curindex+1)),"请选择任意一个问题");
    };
    for(ld_i=0;ld_i<3;ld_i++)
    {
        lo_ctrl=g_elementsArr[12+2*ld_i];
        f_removeSelectValues(lo_ctrl, ld_arySelectedValues);
    };
    f_subtractSelectValues(ld_allKeys, ld_arySelectedValues);
    for(ld_i=0;ld_i<3;ld_i++)
    {
        lo_ctrl=g_elementsArr[12+2*ld_i];
        f_addSelectKeys(lo_ctrl,ld_allKeys);
    };
    var ld_promptText="";
    if(0!=lo_selectCtrl.selectedIndex)
    {
        var l_questionValue=lo_selectCtrl.options[lo_selectCtrl.selectedIndex].text;
        ld_allKeys=f_getKeys();
        for(ld_i=0;ld_i<ld_allKeys.length;ld_i++)
        {
            ld_key=ld_allKeys[ld_i].split(g_KeyInnerSplit);
            if(ld_key[0]==l_questionValue)
            {
                ld_promptText=g_promptText[parseInt(ld_key[2],10)];
                break;
            };
        };
    };
    lo_ctrl=$(g_IdArray[25]+ld_curindex);
    lo_ctrl.innerHTML=ld_promptText;
    if(ld_promptText=="")
    {
        lo_ctrl.style.display="none";
    }
    else
    {
        lo_ctrl.style.display="block";
    };
    lo_ctrl=g_elementsArr[13+2*ld_curindex];
    if(lo_ctrl.value.length!=0)
    {
        f_checkAnswer(lo_ctrl);
    }
    else if(g_HaveCheckAll)
    {
        f_ChangeDivStyle((g_IdArray[23]+ld_curindex),true);
        f_showInfoInLayer($(g_IdArray[24]+ld_curindex),"请输入您要设定的答案");
        Util_ErrMap.mf_AddToErrMap(g_IdArray[47],("答案"+(ld_curindex+1)),"请输入您要设定的答案");
    };
};
function f_checkAnswer(lo_AnswerObj)
{
    var ld_curindex=f_GetCurIndex(13,lo_AnswerObj);
    if(ld_curindex==-1)
    {
        return false;
    };
    var lo_SelectObj=g_elementsArr[12+2*ld_curindex];
    if(lo_SelectObj.selectedIndex==0)
    {
        f_ChangeDivStyle((g_IdArray[21]+ld_curindex),true);
        f_showLayer(g_IdArray[22]+ld_curindex);
        Util_ErrMap.mf_AddToErrMap(g_IdArray[47],("问题"+(ld_curindex+1)),"请选择任意一个问题");
        return false;
    };
    var ld_allKeys=f_getKeys();
    var ld_index=-1,l_checkType;
    for(var ld_j=0;ld_j<ld_allKeys.length;ld_j++)
    {
        var ld_key=ld_allKeys[ld_j].split(g_KeyInnerSplit);
        if(lo_SelectObj.options[lo_SelectObj.selectedIndex].text==ld_key[0])
        {
            ld_index=ld_j;
            l_checkType=ld_key[2];
            break;
        };
    };
    var lo_e_AnswerObj=$(g_IdArray[24]+ld_curindex);
    if(ld_index!=-1)
    {
        var ld_bError=false;
        var l_ErrPrompt="";
        do
        {
            if(lo_AnswerObj.value.length==0)
            {
                l_ErrPrompt="请输入您要设定的答案";
                ld_bError=true;
                break;
            }
            else
            {
                if((lo_AnswerObj.value.charAt(0)==' ')||(lo_AnswerObj.value.charAt(lo_AnswerObj.value.length-1)==' '))
                {
                    l_ErrPrompt="答案首尾不能包含空格";
                    ld_bError=true;
                    break;
                };
                if(!f_checkInputByType(l_checkType,lo_AnswerObj.value))
                {
                    l_ErrPrompt="答案格式不正确";
                    ld_bError=true;
                    break;
                };
                var l_bitMaskArr=[0,0,0];
                for(var ld_i=0;ld_i<3;ld_i++)
                {
                    if((l_bitMaskArr[ld_i]!=0)||(g_elementsArr[12+2*ld_i].selectedIndex==0))
                    {
                        continue;
                    };
                    for(var ld_j=ld_i+1;ld_j<3;ld_j++)
                    {
                        if(g_elementsArr[12+2*ld_j].selectedIndex==0)
                        {
                            continue;
                        };
                        if(g_elementsArr[13+2*ld_i].value==g_elementsArr[13+2*ld_j].value)
                        {
                            l_bitMaskArr[ld_i]=l_bitMaskArr[ld_j]=1;
                        };
                    };
                };
                var l_tmpContent="不能和其它答案相同";
                var l_errObj;
                for(var ld_i=0;ld_i<3;ld_i++)
                {
                    l_errObj=$(g_IdArray[24]+ld_i);
                    if(l_bitMaskArr[ld_i]!=0)
                    {
                        f_ChangeDivStyle((g_IdArray[23]+ld_i),true);
                        f_showInfoInLayer(l_errObj,l_tmpContent);
                        Util_ErrMap.mf_AddToErrMap(g_IdArray[47],("答案"+(ld_i+1)),l_tmpContent);
                    }
                    else if(l_errObj.innerHTML==l_tmpContent)
                    {
                        f_showInfoInLayer(l_errObj,"");
                        f_ChangeDivStyle((g_IdArray[23]+ld_i),false);
                        Util_ErrMap.mf_DelFromErrMap(("答案"+(ld_i+1)));
                    };
                };
                if(l_bitMaskArr[ld_curindex]!=0)
                {
                    return false;
                };
            };
        }while(false);
        if(ld_bError)
        {
            f_ChangeDivStyle((g_IdArray[23]+ld_curindex),true);
            f_showInfoInLayer(lo_e_AnswerObj,l_ErrPrompt);
            Util_ErrMap.mf_AddToErrMap(g_IdArray[47],("答案"+(ld_curindex+1)),l_ErrPrompt);
            return false;
        };
    };
    f_showInfoInLayer(lo_e_AnswerObj,"");
    f_ChangeDivStyle((g_IdArray[23]+ld_curindex),false);
    Util_ErrMap.mf_DelFromErrMap(("答案"+(ld_curindex+1)));
    return true;
};
*/
function f_readCookie(ld_name)
{
    var ld_cookieValue="";
    var ld_search=ld_name+"=";
    if(document.cookie.length>0)
    {
        var ld_offset=document.cookie.indexOf(ld_search);
        if(ld_offset!=-1)
        {
            ld_offset+=ld_search.length;
            var ld_end=document.cookie.indexOf(";",ld_offset);
            if(ld_end==-1) 
            {
                ld_end=document.cookie.length;
            };
            ld_cookieValue=unescape(document.cookie.substring(ld_offset,ld_end));
        };
    };
    return ld_cookieValue;
};
var g_TextItemArr=[0,1,4,5,13,15,17,23];
var g_NameRandSeed=new Array(0,0,0,0,0,0,0,0,0,0);
var g_bCheckConn=false;
function f_IncHitCount(ld_index)
{
    g_HitCountArr[ld_index]++;
};
var g_dataArray;
var g_RealPostData;
function f_AdjustForm()
{
    if(!g_bCheckConn)
    {
        return;
    };
    try
    {
        if(g_dataArray[0].length!=g_dataArray[1].length)
        {
            return;
        };
        g_regform.action=g_dataArray[2];
        var l_otherRandSeed=f_readCookie("PCCOOKIE");
        if(l_otherRandSeed.length==0)
        {
            return;
        };
        g_RealPostData = "";
        var l_indexa,l_indexb,l_len=l_otherRandSeed.length;
        var l_base=parseInt(l_otherRandSeed.substring(l_len-2,l_len),16);
        var lo_tmpArr = new Array(g_dataArray[0].length);
        for(var ld_i=0,ld_lena=g_dataArray[1].length;ld_i<ld_lena;ld_i++)
        {
            l_indexa=g_dataArray[1][ld_i]^l_base;
            l_indexb=g_dataArray[1].length-ld_i-1;
            for(var ld_j=0,ld_lenb=g_NameRandSeed.length;ld_j<ld_lenb;ld_j++)
            {
                l_indexa^=g_NameRandSeed[ld_j];
            };
            l_indexa%=g_elementsArr.length;
            g_elementsArr[l_indexa].name=g_dataArray[0][l_indexb];
            g_RealPostData  += g_elementsArr[l_indexa].name + "=" +encodeURIComponent(g_elementsArr[l_indexa].value) + "&";
        };
		log(g_RealPostData);
    }
    catch(e)
    {};
    //FIXME debug
    var tmpString="";
    /*
    for(var i=0;i<g_elementsArr.length;i++) 
    {
        tmpString += g_elementsArr[i].name+"\n";
    }
    */
    for(var i=0;i<g_NameRandSeed.length;i++) 
    {
        tmpString += i+": "+g_NameRandSeed[i]+"\n";
    }
    log("randseed="+l_otherRandSeed+"\nbase="+l_base+"\n");
   log(tmpString);
};
var g_HitCountArr=new Array(0,0,0,0);
function f_WriteHitCookie()
{
    var ld_data=0;
    for(var ld_i=0;ld_i<g_HitCountArr.length;ld_i++)
    {
        ld_data=(ld_data<<8)|(g_HitCountArr[ld_i]&0xFF);
    };
    document.cookie="htc="+ld_data+"; path=/; domain=qq.com";
};
var g_data="";
function f_processPost() 
{
    log("enter process post");
    if(!g_http_request_form || g_http_request_form.readyState != 4 || g_http_request_form.status != 200) 
    {
        return;
    }
    if(/^\s*\/\/javascript/i.test(g_http_request_form.responseText))
    {
        var lo_LayerObj = $("e_validecode");
        f_showInfoInLayer(lo_LayerObj, "验证码输入不正确");
        g_http_request_form.abort();
        g_SubmitStatus.setStatusComplete();
    }else
    {
        g_data = g_http_request_form.responseText;
        setTimeout("document.write(g_data);", 100);
    }
}
function f_postdata(ld_action,lf_process)
{
    var ld_RealPostData="";
    if(!g_http_request_form) 
    {
        g_http_request_form = XmlHttp.mf_createxmlhttp();
    }
    if(!g_http_request_form)
    {
        return false;
    }
    if(g_SubmitStatus.getStatus()) return true;
    g_SubmitStatus.setStatusSubmit(1000*15);

    XmlHttp.mf_postrequest(g_http_request_form,ld_action,lf_process,g_RealPostData);
}
window.onload=function(){f_Init();};
