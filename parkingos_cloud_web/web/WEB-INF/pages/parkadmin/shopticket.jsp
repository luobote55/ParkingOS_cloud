<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�Ż�ȯ��ѯ</title>
<link href="css/tq.css" rel="stylesheet" type="text/css">
<link href="css/iconbuttons.css" rel="stylesheet" type="text/css">

<script src="js/tq.js?0817" type="text/javascript">//����</script>
<script src="js/tq.public.js?0817" type="text/javascript">//����</script>
<script src="js/tq.datatable.js?0817" type="text/javascript">//����</script>
<script src="js/tq.form.js?0817" type="text/javascript">//����</script>
<script src="js/tq.searchform.js?0817" type="text/javascript">//��ѯ����</script>
<script src="js/tq.window.js?0817" type="text/javascript">//����</script>
<script src="js/tq.hash.js?0817" type="text/javascript">//��ϣ</script>
<script src="js/tq.stab.js?0817" type="text/javascript">//�л�</script>
<script src="js/tq.validata.js?0817" type="text/javascript">//��֤</script>
<script src="js/My97DatePicker/WdatePicker.js" type="text/javascript">//����</script>
</head>
<body>
<div id="ticketobj" style="width:100%;height:100%;margin:0px;"></div>
<iframe src="" id ="exportiframe" frameborder="0" style="width:0px;height:0px;"></iframe>
<script language="javascript">
/*Ȩ��*/
var authlist = T.A.sendData("getdata.do?action=getauth&authid=${authid}");
var subauth=[false,false,false];
var ownsubauth=authlist.split(",");
for(var i=0;i<ownsubauth.length;i++){
	subauth[ownsubauth[i]]=true;
}
//�鿴  ����ר��ȯ  ����
//var ticket_type = [{"value_no":-1,"value_name":"ȫ��"},{"value_no":0,"value_name":"��ͨͣ��ȯ"},
//                   {"value_no":1,"value_name":"ר��ͣ��ȯ"},{"value_no":2,"value_name":"΢�Ŵ���ȯ"},
//                   {"value_no":3,"value_name":"ʱ������"},{"value_no":4,"value_name":"ȫ��ȯ"},
//                   {"value_no":5,"value_name":"������"}];
var ticket_type = [{"value_no":-1,"value_name":"ȫ��"},{"value_no":3,"value_name":"ʱ������"},{"value_no":4,"value_name":"ȫ��ȯ"},{"value_no":5,"value_name":"������"}];
var _mediaField = [
		{fieldcnname:"���",fieldname:"id",fieldvalue:'',inputtype:"number", twidth:"100" ,height:"",issort:false,edit:false},
		{fieldcnname:"�̻�����",fieldname:"shop_name",fieldvalue:'',inputtype:"text", twidth:"150" ,height:"",issort:false},
		{fieldcnname:"�Ż�ʱ��(����)",fieldname:"money_minute",fieldvalue:'',inputtype:"number", twidth:"100" ,height:"",issort:false},
        {fieldcnname:"�Ż�ʱ��(Сʱ)",fieldname:"money_hour",fieldvalue:'',inputtype:"number", twidth:"100" ,height:"",issort:false},
        {fieldcnname:"�Ż�ʱ��(��)",fieldname:"money_day",fieldvalue:'',inputtype:"number", twidth:"100" ,height:"",issort:false},
		{fieldcnname:"�Żݽ��",fieldname:"umoney",fieldvalue:'',inputtype:"number", twidth:"100" ,height:"",issort:false},
		{fieldcnname:"����ʱ��",fieldname:"limit_day",fieldvalue:'',inputtype:"date", twidth:"150" ,height:"",hide:true},
		//{fieldcnname:"ʹ��ʱ��",fieldname:"utime",fieldvalue:'',inputtype:"date", twidth:"130" ,height:"",hide:true},
		//{fieldcnname:"����",fieldname:"uin",fieldvalue:'',inputtype:"text", twidth:"80" ,height:"",issort:false},
		{fieldcnname:"״̬",fieldname:"state",fieldvalue:'',inputtype:"select",noList:[{"value_no":"-1","value_name":"ȫ��"},{"value_no":"0","value_name":"δʹ��"},{"value_no":"1","value_name":"��ʹ��"},{"value_no":"2","value_name":"��������"}], twidth:"100" ,height:"",issort:false},
		{fieldcnname:"���ƺ�",fieldname:"car_number",fieldvalue:'',inputtype:"text", twidth:"100" ,height:"",issort:false},
		{fieldcnname:"�Ż�ȯ����",fieldname:"type",fieldvalue:'',inputtype:"select",noList:ticket_type,twidth:"100" ,height:"",issort:false}
	];
//�߼���ѯ
var _highField = [
    {fieldcnname:"���",fieldname:"id",fieldvalue:'',inputtype:"number", twidth:"100" ,height:"",issort:false,edit:false},
    {fieldcnname:"�̻�����",fieldname:"shop_name",fieldvalue:'',inputtype:"text", twidth:"150" ,height:"",issort:false},
    {fieldcnname:"�Żݽ��",fieldname:"umoney",fieldvalue:'',inputtype:"number", twidth:"100" ,height:"",issort:false},
    {fieldcnname:"�Ż�ʱ��",fieldname:"money",fieldvalue:'',inputtype:"number", twidth:"100" ,height:"",issort:false},
    {fieldcnname:"�Ż�ʱ����λ",fieldname:"ticket_unit",inputtype:"select", noList:[{"value_no":1,"value_name":"����"},{"value_no":2,"value_name":"Сʱ"},{"value_no":3,"value_name":"��"},{"value_no":4,"value_name":"Ԫ"}], twidth:"500",issort:false},
    {fieldcnname:"����ʱ��",fieldname:"limit_day",fieldvalue:'',inputtype:"date", twidth:"150" ,height:"",hide:true},
    //{fieldcnname:"ʹ��ʱ��",fieldname:"utime",fieldvalue:'',inputtype:"date", twidth:"130" ,height:"",hide:true},
    //{fieldcnname:"����",fieldname:"uin",fieldvalue:'',inputtype:"text", twidth:"80" ,height:"",issort:false},
    {fieldcnname:"״̬",fieldname:"state",fieldvalue:'',inputtype:"select",noList:[{"value_no":"-1","value_name":"ȫ��"},{"value_no":"0","value_name":"δʹ��"},{"value_no":"1","value_name":"��ʹ��"},{"value_no":"2","value_name":"��������"}], twidth:"100" ,height:"",issort:false},
    {fieldcnname:"���ƺ�",fieldname:"car_number",fieldvalue:'',inputtype:"text", twidth:"100" ,height:"",issort:false},
    {fieldcnname:"�Ż�ȯ����",fieldname:"type",fieldvalue:'',inputtype:"select",noList:ticket_type,twidth:"100" ,height:"",issort:false}
];
var _ticketT = new TQTable({
	tabletitle:"�Ż�ȯ��ѯ",
	ischeck:false,
	tablename:"ticket_tables",
	dataUrl:"shopticket.do",
	iscookcol:false,
	//dbuttons:false,
	buttons:getAuthButtons(),
	//searchitem:true,
	param:"action=quickquery",
	tableObj:T("#ticketobj"),
	fit:[true,true,true],
	tableitems:_mediaField,
	isoperate:false
});
function getAuthButtons(){
	var bts =[];
	if(subauth[0])
	bts.push({dname:"�߼���ѯ",icon:"edit_add.png",onpress:function(Obj){
		T.each(_ticketT.tc.tableitems,function(o,j){
			o.fieldvalue ="";
		});
		Twin({Id:"ticket_search_w",Title:"�����Ż�ȯ",Width:550,sysfun:function(tObj){
				TSform ({
					formname: "ticket_search_f",
					formObj:tObj,
					formWinId:"ticket_search_w",
					formFunId:tObj,
					formAttr:[{
						formitems:[{kindname:"",kinditemts:_highField}]
					}],
					buttons : [//����
						{name: "cancel", dname: "ȡ��", tit:"ȡ������",icon:"cancel.gif", onpress:function(){TwinC("ticket_search_w");} }
					],
					SubAction:
					function(callback,formName){
						_ticketT.C({
							cpage:1,
							tabletitle:"�߼��������",
							extparam:"&action=query&"+Serializ(formName)
						})
					}
				});	
			}
		})
	
	}});
	if(subauth[1])
	bts.push({dname:"����ר��ͣ��ȯ",icon:"edit_add.png",onpress:function(Obj){
			location = "parkticket.do";
		}
	});
	if(subauth[2])
	bts.push({dname:"����ͣ��ȯ",icon:"toxls.gif",onpress:function(Obj){
	
		Twin({Id:"ticket_export_w",Title:"����ͣ��ȯ<font style='color:red;'>�����û�����ã�Ĭ��ȫ������!��</font>",Width:480,sysfun:function(tObj){
				 TSform ({
					formname: "ticket_export_f",
					formObj:tObj,
					formWinId:"ticket_export_w",
					formFunId:tObj,
					dbuttonname:["ȷ�ϵ���"],
					formAttr:[{
						formitems:[{kindname:"",kinditemts:_mediaField}],
					}],
					//formitems:[{kindname:"",kinditemts:_excelField}],
					SubAction:
					function(callback,formName){
						T("#exportiframe").src="ticket.do?action=exportExcel&rp="+2147483647+"&fieldsstr="+"id__money__umoney__limit_day__uin__state__car_number__type&"+Serializ(formName)
						TwinC("ticket_export_w");
						T.loadTip(1,"���ڵ��������Ժ�...",2,"");
					}
				});	
			}
		})
	}});
	if(bts.length>0)
		return bts;
	return false;
}
_ticketT.C();
</script>

</body>
</html>