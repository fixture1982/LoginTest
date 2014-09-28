//��������
function create_obj(){
    var http_request = false;

    //��ʼ��ʼ��XMLHttpRequest����
    if(window.XMLHttpRequest) { //Mozilla �����
        http_request = new XMLHttpRequest();
        if (http_request.overrideMimeType) {//����MiME���
            http_request.overrideMimeType("text/xml");
        }
    }
    else if (window.ActiveXObject) { // IE�����
        try {
            http_request = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            try {
                http_request = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) {}
        }
    }

    if (!http_request) { // �쳣����������ʵ��ʧ��
        return false;
    }

    return http_request;
}

//��ʼ����ָ������������������ĺ���
//var postStr = "ACT=reply&bookid="+bookid+"&book_content="+ book_content;
//type:post or get
function send_request(http_request,url,postStr) {
    // ȷ����������ķ�ʽ��URL�Լ��Ƿ�ͬ��ִ���¶δ���
    http_request.open("POST", url, true);
    http_request.setRequestHeader("Content-Type","application/x-www-form-urlencoded"); 
    http_request.send(postStr);
}

function getCheck(){
    var http_request = create_obj();
    http_request.onreadystatechange = function(){
        if (http_request.readyState == 4) {
            if (http_request.status == 200) {
				var http_result2 = http_request.responseText;
				if('�õ�¼������ʹ��'==http_result2){
					cancel_popup_win('username',true);
					username_check = true;
				}else{
				    popup_win('username',http_result2);
				    username_check = false;
				}

            }
        }
    }
    var username=document.getElementById('username').value;
    var postStr = "act=check&userid="+ username;
    send_request(http_request,"http://service.zol.com.cn/user/check.php",postStr);
}
function getCheckEmail(){
    var http_request = create_obj();
    http_request.onreadystatechange = function(){
        if (http_request.readyState == 4) {
            if (http_request.status == 200) {
				var http_result3 = http_request.responseText;
				if('����email��ַ����'==http_result3){
					cancel_popup_win('Email',true);
                    mail_check = true;
				}else{
				    popup_win('Email',http_result3);
                    mail_check = false;
				}
            }
        }
    }
    var Email=document.getElementById('Email').value;
    var postStr = "act=check&email="+ Email;
    send_request(http_request,"http://service.zol.com.cn/user/check_email.php",postStr);
}

function getimgcode(){
    var http_request = create_obj();
    http_request.onreadystatechange = function(){
        if (http_request.readyState == 4) {
            if (http_request.status == 200) {
				var http_result6 = http_request.responseText;
                if('��֤����д��ȷ'== http_result6){
					cancel_popup_win('door',true);
					door_check = true;
				}else{
				    popup_win('door',http_result6);
                    door_check = false;
				}
				
            }
        }
    }
    var door=document.getElementById('door').value;
    var postStr = "act=check&door="+ door;
    send_request(http_request,"http://service.zol.com.cn/user/check_door.php",postStr);
}

function check_warn(){
    var http_request = create_obj();
    http_request.onreadystatechange = function(){
        if (http_request.readyState == 4) {
            if (http_request.status == 200) {
				alert(http_request.responseText);
            }
        }
    }
    var postStr = "act=check";
    send_request(http_request,"http://service.zol.com.cn/user/check_warn.php",postStr);
}