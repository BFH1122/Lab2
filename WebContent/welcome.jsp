<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>

<html>
<head>
    <meta name="viewport" content="width=device-width" />
    <title>BOOKDB</title>
    <link href="easyui.css" rel="stylesheet" />
    <link href="login.css" rel="stylesheet"/>
    <link href="icon.css" rel="stylesheet" />
    <link href="demo.css" rel="stylesheet" />
    <link href="validatebox.css" rel="stylesheet" />
    <script src="jquery.min.js"></script>
    <script src="jquery.easyui.min.js"></script>
    <script src="easyui-lang-zh_CN.js"></script>
    <script src="datagrid-detailview.js"></script>
    
    <style type="text/css">
            * {
                padding: 0;
                margin: 0;
            }
            body,html {
                height: 100%;
                background-image:url('img/2.jpg');
                background-size:100%,100%;
            }
            li{
                list-style: none;
            }
            body {
                -moz-perspective: 2000px;
                perspective: 2000px;
                background-color: red;
            }
            .book {
                position: absolute;
                top: 10%;
                left: 50%;
                width: 470px;
                height: 500px;
                background-color: yellow;
                
            }
            .pre-3d {                
                -webkit-transform-style: preserve-3d;
                -moz-transform-style: preserve-3d;
                -ms-transform-style: preserve-3d;
                transform-style: preserve-3d;
            }
            .page {
                position: absolute;
                top: 0;
                left: 0;
                width: 470px;
                height: 500px;
                border: 1px solid #1976D2;
                text-align: center;
                -webkit-transform-origin: 0 50%;
                -moz-transform-origin: 0 50%;
                -ms-transform-origin: 0 50%;
                -o-transform-origin: 0 50%;
                transform-origin: 0 50%;
            }
            .front1 {
                background-color: paleturquoise;
            }
            .front2 {
                background-color: goldenrod;
                
            }    
            img{
                width: 100%;
                height: 100%;
            }
            .backg1{
            	
    			background-size: 100%,100%;
            }
             .backg2{
            	background:url('img/11.jpg') center center no-repeat;
            	
    			background-size:cover;
            }
            .backg3{
            	background:url('img/3.jpg') center center no-repeat;
            	
    			background-size:cover;
            }
            .a{
            	width:300px;
            	height:30px;
            }
            .txtdiv{
            	line-height:450px;
            }  
        </style>
</head>
<body>
<div class="book pre-3d" id="book">
            <!-- 后封面 -->
            <ul>
            <li class="" id=""></li>
            <!-- 书页 -->
            <li class="pre-3d  page front2 txtdiv backg3">
            		<h1>谢谢使用</h1>
            </li>
            <li class="pre-3d  page front2"><img src="img/4.jpg" alt="">
            </li>
            <li class="pre-3d  page front2 backg2">
            <div class="">
   					 <table id="dg">
   				</table></li>
   			<li class="pre-3d  page front2"><img src="img/5.jpg" alt=""></li>
            <li class="pre-3d  page front2 backg2">
            	<h1>使用说明</h1>
            	<div>
            	<p>点击行前的+号，展示书本的相关内容</p>
            	<p>若在进行操作后表格无变化，请使用刷新按钮</p>
            	<p style="color:red">请注意：某些作者的相关信息并不真实</p>
            	</div>
            </li>	
            <li class="pre-3d  page front2"></li>
            <li class="pre-3d  page front1 backg1">
            	<h1 class="txtdiv">欢迎使用</h1>
            	<p align="right">作者id：1150250111</p>
            </li>
           </ul>
</div>
<div align="center">
	<button class="left" id="Rcover" class="btn1">上一页</button>
	<button class="right" id="go" class="btn2">下一页</button>
</div>
    <div id="toolbar" style="padding:3px">
        <div>
            <a href="#" class="easyui-linkbutton" iconcls="icon-add" plain="true" onclick="newUser()">增加</a>
            <a href="#" class="easyui-linkbutton" iconcls="icon-edit" plain="true" id="edit" onclick="doEdit()">编辑</a>
            <a href="#" class="easyui-linkbutton" iconcls="icon-remove" plain="true" onclick="doRemove()">删除</a>
            <a href="#" class="easyui-linkbutton" iconcls="icon-reload" plain="true" onclick="reload()">刷新</a>
            <span>姓名</span>
            <input id="searchName" style="line-height:20px;border:1px solid #ccc">
            <a href="#" class="easyui-linkbutton" plain="true" iconcls="icon-search" onclick="doSearch()">查询</a>
        </div>
    </div>

    <div id="menu" class="easyui-menu">
        <div onclick="newUser()">新增</div>
        <div onclick="doEdit()">编辑</div>
        <div onclick="doRemove()">删除</div>
    </div>
    
    <div id="dlg" class="easyui-dialog" style="width:400px;height:300px;padding:10px 20px" closed="true" buttons="#dlg-buttons">
		<table id="dgg"></table>
	</div>
	
	<div id="dlg-buttons">
		
		<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">Cancel</a>
	</div>
    
    <div id="dnewg" class="easyui-dialog" style="width:400px;height:300px;padding:10px 20px" closed="true">
		<div class="ftitle a" align="center">Book Information</div>
		<form id="fm" method="post">
			<div class="fitem a" align="right">
				<label >isbn:</label>
				<input id="isb" name="isbn" class="validatebox" required="true">
			</div>
			<div class="fitem a" align="right">
				<label>题目:</label>
				<input id="tit" name="title" class="validatebox" required="true">
			</div>
			<div class="fitem a" align="right">
				<label>作者id:</label>
				<input id="zh" name="authorid" class="validatebox" required="true">
			</div>
			<div class="fitem a" align="right">
				<label>出版社:</label>
				<input id="pub" name="publisher" class="validatebox" required="true">
			</div>
				<div class="fitem a" align="right">
				<label>出版日期:</label>
				<input id="pud" name="publishDate" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser"></input>
				<!--<input id="pud" name="publishDate" class="easyui-validatebox" required="true">-->
			</div>
				<div class="fitem a" align="right">
				<label>价格:</label>
				<input id="pri" name="price" class="validatebox" required="true">
			</div>
			<div align="right">
				<a href="#"  class="easyui-linkbutton" iconCls="icon-ok" onclick="addbook()">Save</a>
				<a href="#"  class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dnewg').dialog('close')">Cancel</a>
			</div>
		</form>
	</div>
	
	<div id="dnewuser" class="easyui-dialog" style="width:400px;height:300px;padding:10px 20px" closed="true">
		<div class="ftitle a" align="center">Author Information</div>
		<form id="fuser" method="post">
			<div class="fitem a" align="right">
				<label>作者id:</label>
				<input id="aid" name="authorid" class="easyui-validatebox" required="true">
			</div>
			<div class="fitem a" align="right">
				<label>姓名:</label>
				<input id="aname" name="name" class="easyui-validatebox" required="true">
			</div>
			<div class="fitem a" align="right">
				<label>年龄:</label>
				<input id="aage" name="age" class="easyui-validatebox" required="true">
			</div>
			<div class="fitem a" align="right">
				<label>国家:</label>
				<input id="acountry" name="country" class="easyui-validatebox" required="true">
			</div>
			<div align="right">
				<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="subuser()">Save</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dnewuser').dialog('close')">Cancel</a>
			</div>
		</form>
	</div>
	
	 <div id="dochange" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px" closed="true">
		<div class="ftitle a" align="center" >Information</div>
		<form id="fch" method="post" action="change">
			<div class="fitem a" align="right">
				<label>isbn:</label>
				<input name="isbn" class="easyui-validatebox" required="true">
			</div>
			<div class="fitem a" align="right">
				<label>作者:</label>
				<input name="authorid" class="easyui-validatebox" required="true">
			</div>
			<div class="fitem a" align="right">
				<label>出版社:</label>
				<input name="publisher" class="easyui-validatebox" required="true">
			</div>
				<div class="fitem a" align="right">
				<label>出版日期:</label>
				<input name="publishDate" class="datebox" data-options="formatter:myformatter,parser:myparser"></input>
			<!--	<input name="publishDate" class="easyui-validatebox" required="true">-->
			</div>
				<div class="fitem a" align="right">
				<label>价格:</label>
				<input name="price" class="easyui-validatebox" required="true">
			</div>
			<div align="right">
				<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="changeUser()">Save</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dochange').dialog('close')">Cancel</a>
			</div>
		</form>
	</div>
	</div>	
</body>
</html>
<script type="text/javascript">
		function myformatter(date){
			var y = date.getFullYear();
			var m = date.getMonth()+1;
			var d = date.getDate();
			return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
		}
		function myparser(s){
			if (!s) return new Date();
			var ss = (s.split('-'));
			var y = parseInt(ss[0],10);
			var m = parseInt(ss[1],10);
			var d = parseInt(ss[2],10);
			if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
				return new Date(y,m-1,d);
			} else {
				return new Date();
			}
		}
	</script>
<script>
    var b=document.getElementById('go');
    var s=document.getElementsByTagName('li');
    var c=document.getElementById('Rcover');
    var i=7;
b.onclick=function(){
    	
        if(i>1&&i<8){
            s[i].style.transform='rotateY(-140deg)';
            s[i].style.transition='3s';
            i--;
            s[i].style.transform='rotateY(-140deg)';
            s[i].style.transition='3s';
            i--;
        }
    }
    c.onclick=function(){
    	
    	if(i>0&&i<7)
    	{
    		i++;
         	s[i].style.transform='rotateY(0deg)';
         	s[i].style.transition='3s';
         	i++;
         	s[i].style.transform='rotateY(0deg)';
         	s[i].style.transition='3s';
     	}
    }
</script>
<script type="text/javascript">

</script>
<script type="text/javascript">
function reload()
{
	$('#dg').datagrid('reload');
}
</script>
<script type="text/javascript">
$('#dg').datagrid({
	view: detailview,		//<img src="images/' + rowData.itemid + '.png" style="height:50px;"></td>'
	detailFormatter:function(index,row){
		return'<table>'+
		'<tr>' +
		'<td>年龄:       '+row.age+'</td>'+
		'<td>国家:      '+row.country+'</td>'+
		'<td>日期:    '+row.publishDate+'</td>'+
        '</tr>'+
        '<tr>'+
        '<td>版本号:    ' + row.isbn + '</td>' +
        '<td>出版社:    ' + row.publisher + '</td>' +
        '</tr></table>';
	}
});

$('#dgg').datagrid({
	view: detailview,		//<img src="images/' + rowData.itemid + '.png" style="height:50px;"></td>'
	detailFormatter:function(index,row){
		return'<table>'+
		'<tr>' +
		'<td>年龄:       '+row.age+'</td>'+
		'<td>国家:      '+row.country+'</td>'+
		'<td>日期:    '+row.publishDate+'</td>'+
        '</tr>'+
        '<tr>'+
        '<td>版本号:    ' + row.isbn + '</td>' +
        '<td>出版社:    ' + row.publisher + '</td>' +
        '</tr></table>';
	}
});
</script>
<script type="text/javascript">
    var editRow = undefined; 
    var mySelectRow = undefined;
    $(function () {
        $("#dg").datagrid({
            title: "BOOK",
            width: 470,
            height: 500,
            iconCls: 'icon-search', //在标题前面加一个搜索图标
            url: "showb",
            sortName: 'authorid',
            sortOrder: 'ASC',
            toolbar: "#toolbar",
            fitColumns: true, //设置每列的宽度自适应DataGrid设定的宽度。默认为false
            columns: [[
                {
                    title: '编号',
                    field: 'authorid',
                    width: 100,
           
                },
                {
                    title: '姓名',
                    field: 'name',
                    width: 100,
                
                    editor:
                        {
                            type: 'validatebox',
                            options:
                                {
                                    required: true 
                                }
                        }
                },
                {
                    title: '书名',
                    field: 'title',
                    width: 150,
                    editor:
                        {
                            type: 'validatebox',
                            options:
                                {
                                    required: true 
                                }
                        }
                },
                {
                    title: '价格',
                    field: 'price',
                    width: 100,
                
                    editor:
                        {
                            type: 'validatebox',
                            options:
                                {
                                    required: true 
                                }
                        }
                },
            ]],
            
            onRowContextMenu: function (e, rowIndex, rowData) {
                e.preventDefault();
                if (mySelectRow != undefined) {
                    $("#dg").datagrid("unselectRow", mySelectRow);
                    mySelectRow = undefined;
                }

                if (mySelectRow == undefined) {
                    $("#dg").datagrid("selectRow", rowIndex); 
                    mySelectRow = rowIndex;
                }


                $("#menu").menu('show', {
                    left: e.pageX,
                    top: e.pageY,
                });

            },
        })
    })
    
    function doSearch() {
    	$('#dlg').dialog('open').dialog('setTitle','New User');
    	
    	$("#dgg").datagrid({
             title: "MyUss",
             url:'loadd',
             queryParams:{name:$("#searchName").val()},
             fitColumns: true, //设置每列的宽度自适应DataGrid设定的宽度。默认为false
             columns: [[
            	 {
                     title: '编号',
                     field: 'authorid',
                     width: 100,
            
                 },
                 {
                     title: '姓名',
                     field: 'name',
                     width: 100,
                 
                     editor:
                         {
                             type: 'validatebox',
                             options:
                                 {
                                     required: true 
                                 }
                         }
                 },
                 {
                     title: '书名',
                     field: 'title',
                     width: 120,
                     editor:
                         {
                             type: 'validatebox',
                             options:
                                 {
                                     required: true 
                                 }
                         }
                 },
                 {
                     title: '价格',
                     field: 'price',
                     width: 100,
                 
                     editor:
                         {
                             type: 'validatebox',
                             options:
                                 {
                                     required: true 
                                 }
                         }
                 },
             ]],
    });
   }
    function doRemove() {
    	var row = $('#dg').datagrid('getSelected');
    	url="del";
    	if (row){
    		$.messager.confirm('Confirm','Are you sure you want to destroy this book?',function(r){
    			$.post(url,{authorid:row.authorid,isbn:row.isbn},function(result){
    				$('#dg').datagrid('reload')})
    			});
    		}
    	else{
    		$.messager.alert("error","您没有选中任何一个人");
    	}
    }
    
    
    function newUser(){
    	$('#dnewg').dialog('open').dialog('setTitle','New book');
    	$('#fm').form('clear');
    	url = '#';
    }
     function addbook()
     {
    	 var table=$('#dg').datagrid("getRows");
    	 var num1=$('#zh').val();
    	 for(var i=0;i<table.length;i++)
    	{
    		if(parseInt(num1)==parseInt(table[i].authorid))
    		{
    			break;
    		}
    	}
    	if(i==table.length)
    	{
    		adduser();
    		return;
    	}
    	url="addbook";
    	$.post(url,{isbn:$('#isb').val(),title:$('#tit').val(),authorid:$('#zh').val(),publisher:$('#pub').val(),
    		publishDate:$('#pud').val(),price:$('#pri').val()},
    		function(result){
    				$('#dg').datagrid('reload')});
    	$('#dnewg').dialog('close');
     }
     
     
     function adduser(){
    	 $('#dnewuser').dialog('open').dialog('setTitle','New User');
    	 $('#fuser').form('clear');
    	 $('#fuser').form('load',{"authorid":$('#zh').val()});
    	url = '#';
     }

     function subuser()
     {
    	 url="adduser";
    	 $.post(url,{authorid:$('#aid').val(),name:$('#aname').val(),age:$('#aage').val(),country:$('#acountry').val()});
    	 /*$('#fuser').form('submit',{
    			type:"post",
    			url:"adduser"
    		});*/
    	 url="addbook";
    		$.post(url,{isbn:$('#isb').val(),title:$('#tit').val(),authorid:$('#zh').val(),publisher:$('#pub').val(),
    			publishDate:$('#pud').val(),price:$('#pri').val()},
    			function(result){
    					$('#dg').datagrid('reload')});
    	/* $('#fm').form('submit',{
    			type:"post",
    			url:"addbook"
    	});*/
    	$('#dnewg').dialog('close');
    	$('#dnewuser').dialog('close');
    	/*alert("开始刷新");
    	$('#dg').datagrid('reload');
    	alert("刷新完成");
    	reload();*/
     }
     
     function doEdit() {
    	    var selectRows = $("#dg").datagrid("getSelections");
    	    if (selectRows.length > 1) {
    	        $.messager.alert("提示", "不能同时编辑多行,一次只能编辑一行！", 'info');
    	    }
    	    else if (selectRows < 1) {
    	        $.messager.alert("提示", "请选择要编辑的行！", "info");
    	    }
    	    else {
    	    	var row = $('#dg').datagrid('getSelected');
    	    		$('#dochange').dialog('open').dialog('setTitle','Edit book');
    	    		$('#fch').form('load',row);
    	    	}
    	    }
    	function changeUser()
    	{
    		$('#fch').form('submit',{
    			type:"post",
    			url:"change"
    		});
    		$('#dg').datagrid('reload');
    		$('#dochange').dialog('close');
    	}
     
     
</script>