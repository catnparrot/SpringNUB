<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
<%@include file="../includes/header.jsp" %>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Read</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Read</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				
				<div class="form-group">
					<label>Bno</label>
					<input class="form-control" name='bno' 
						value='<c:out value="${board.bno }" />' readonly="readonly">
				</div>
				
				<div class="form-group">
					<label>Title</label>
					<input class="form-control" name='title' 
						value='<c:out value="${board.title }" />' readonly="readonly">
				</div>
				
				<div class="form-group">
					<label>Text area</label>
					<textarea class="form-control" rows="3" name="content" readonly="readonly"><c:out value="${board.content }"/></textarea>
				</div>
				
				<div class="form-group">
					<label>Writer</label> <input class="form-control" name='writer' value='<c:out value="${board.writer }" />' readonly="readonly">
				</div>
				
				<button data-oper='modify' class="btn btn-default" onclick="location.href='/board/modify?bno=<c:out value="${board.bno }"/>'">Modify</button>
				<button data-oper='list' class="btn btn-info" onclick="location.href='/board/list'">List</button>
			
				<form id='operForm' action="/board/modify" method="get">
					<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno }" />' >
					<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }" />' >
					<input type='hidden' name='amount' value='<c:out value="${cri.amount }" />' >
					<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }" />' >
					<input type='hidden' name='type' value='<c:out value="${cri.type }" />' >
				</form>
				
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<!-- row(reply 작업) -->
<div class='row'>
	<div class="col-lg-12">
	
		<div class="panel panel-default">			 
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i> Reply
				<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
			</div>
			<div class="panel-body">
				<ul class="chat">
									<!-- start reply -->
									<!-- example -->
									<!-- 
									<li class="left clearfix" data-rno='12'>
										<div>
											<div class="header">
												<strong class="primary-font">user00</strong>
												<small class="pull-right text-muted">1</small>
											</div>
											<p>Good job!</p>
										</div>
									</li>
									 -->
									<!-- end reply -->
				</ul>
				<!-- end ul -->
				
			</div>
			<!-- /.panel-body .chat-panel -->
			<div class="panel-footer">
			
			</div>
		</div>
		<!-- /.panel -->
	</div>
</div>
<!-- end row -->


<!-- start Modal for addReply-Btn -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
				&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>Reply</label>
					<input class="form-control" name='reply' value='New Reply!'>
				</div>
				<div class="form-group">
					<label>Replyer</label>
					<input class="form-control" name='replyer' value='replyer' readonly>
				</div>
				<div class="form-group">
					<label>Reply Date</label>
					<input class="form-control" name='replyDate' value=''>
				</div>
			</div>
			<div class="modal-footer">
				<button id='modalModBtn' type="button" class="btn btn-warning">
				Modify
				</button>
				<button id='modalRemoveBtn' type="button" class="btn btn-danger">
				Remove
				</button>
				<button id='modalRegisterBtn' type="button" class="btn btn-primary" data-dismiss='modal'>
				Register
				</button>
				<button id='modalCloseBtn' type="button" class="btn btn-default" data-dismiss="modal">
				Close
				</button>
				
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- end Modal for addReply-Btn -->


<script type="text/javascript" src="/resources/js/reply.js"></script>

<script>
/* 
console.log("===================");
console.log("JS TEST - getReply");

replyService.get(15, function(data){
	console.log(data);
});
 */
</script>


<script>
/* 
console.log("===================");
console.log("JS TEST - UpdateReply");

let bnoValue='<c:out value="${board.bno}" />';

replyService.update({
	rno: 22,
	bno: bnoValue,
	reply: "Modified Reply..."
}, function(result){
	alert("수정완료");
})
 */
</script>

<script>
/*  
console.log("===================");
console.log("JS TEST - RemoveReply");

replyService.remove(11, function(count){
	console.log(count);
	
	if (count === "success"){
		alert("REMOVED");
	}
}, function(err) {
	alert('Error...');
});
 */
</script>


<script>
/* 
console.log("===================");
console.log("JS TEST - ListReply");

let bnoValue='<c:out value="${board.bno}" />';
 
replyService.getList({bno:bnoValue, page:1}, function(list){
	 for(let i = 0, len=list.length||0; i<len; i++){
		 console.log(list[i]);
	 }
});
 */
</script>


<script>
/* 
console.log("===================");
console.log("JS TEST - addReply");

let bnoValue='<c:out value="${board.bno}" />';

replyService.add(
		{reply:"JS TEST", replyer:"tester", bno:bnoValue}
		,
		function(result){
			alert("RESULT: " + result);
		}
);
 */
</script>

<script>
$(document).ready(function() {

	let operForm = $("#operForm");
	$("button[data-oper='modify']").on("click", function(e){
		operForm.attr("action", "/board/modify").submit();
	});
	
	$("button[data-oper='list']").on("click", function(e){
		operForm.find("#bno").remove();
		operForm.attr("action", "/board/list")
		operForm.submit();
	});
	
	
 	let bnoValue = '<c:out value="${board.bno }" />';
	let replyUL = $(".chat");
	
	showList(1);
	
	function showList(page){
		replyService.getList({bno:bnoValue, page: page||1}, function(replyCnt, list){
			
			if(page==-1){
				pageNum = Math.ceil(replyCnt/10.0);
				showList(pageNum);
				return;
			}
			
			let str="";
			if(list == null || list.length==0){
				replyUL.html("");
				
				return;
			}
			for(let i=0, len=list.length || 0; i<len; i++){
				str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
				str +="	<div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
				str +="		<small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
				str +="			<p>"+list[i].reply+"</p></div></li>";
			}
			
			replyUL.html(str);
			
			showReplyPage(replyCnt);
		}); //end replyService
	}	//end function showList	
	
	let modal=$(".modal");
	let modalInputReply = modal.find("input[name='reply']");
	let modalInputReplyer = modal.find("input[name='replyer']");
	let modalInputReplyDate = modal.find("input[name='replyDate']");
	
	let modalModBtn = $("#modalModBtn");
	let modalRemoveBtn = $("#modalRemoveBtn");
	let modalRegisterBtn = $("#modalRegisterBtn");
	
	$("#addReplyBtn").on("click", function(e){
		modal.find("input").val("");
		modalInputReplyDate.closest("div").hide();
		modal.find("button[id != 'modalCloseBtn']").hide();
		
		modalRegisterBtn.show();
		
		$(".modal").modal("show");
	});
	
	modalRegisterBtn.on("click", function(e){
		let reply = {
				reply: modalInputReply.val(),
				replyer: modalInputReplyer.val(),
				bno: bnoValue
		};
		
		replyService.add(reply, function(result){
			alert(result);
			
			modal.find("input").val("");
			modal.modal("hide");
			
			showList(-1);
		});
	});
	
	$(".chat").on("click", "li", function(e){
		let rno = $(this).data("rno");
		
		replyService.get(rno, function(reply){
			modalInputReply.val(reply.reply);
			modalInputReplyer.val(reply.replyer);
			modalInputReplyDate.val(replyService.displayTime(reply.replyDate))
			.attr("readonly", "readonly");
			modal.data("rno", reply.rno);
			
			modal.find("button[id != 'modalCloseBtn']").hide();
			modalModBtn.show();
			modalRemoveBtn.show();
			
			$(".modal").modal("show");
		});
		
		console.log(rno);
	});
	
	modalModBtn.on("click", function(e){
		let reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
		
		replyService.update(reply, function(result){
			alert(result);
			modal.modal("hide");
			showList(pageNum);
		});
	});
	
	modalRemoveBtn.on("click", function(e){
		let rno = modal.data("rno");
		replyService.remove(rno, function(result){
			alert(result);
			modal.modal("hide");
			showList(pageNum);
		});
	});
	
	let pageNum = 1;
	let replyPageFooter = $(".panel-footer");
	
	function showReplyPage(replyCnt){
		let endNum = Math.ceil(pageNum/10.0)*10;
		let startNum = endNum -9;
		
		let prev = startNum != 1;
		let next = false;
		
		if(endNum * 10 >= replyCnt){
			endNum = Math.ceil(replyCnt/10.0);
		}
		
		if(endNum * 10 < replyCnt){
			next = true;
		}
		
		let str = "<ul class='pagination pull-right'>";
		
		if(prev){
			str += "<li class='page-item'><a class='page-link' href='"+(startNum-1)+"'>Previous</a></li>";
		}
		
		for(let i = startNum; i<=endNum; i++){
			let active = pageNum == i ? "active" : "";
			
			str += "<li class='page-item "+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
		}
		
		if(next){
			str += "<li class='page-item'><a class='page-link' href='"+(endNum+1)+"'>Next</a></li>";
		}
		
		str +="</ul>"
		
		console.log(str);
		
		replyPageFooter.html(str);
	};
	
	replyPageFooter.on("click", "li a", function(e){
		e.preventDefault();
		console.log("page click");
		let targetPageNum = $(this).attr("href");
		console.log("targetPageNum: " + targetPageNum);
		pageNum = targetPageNum;
		showList(pageNum);
	});
	
	
	
});
</script>

<%@include file="../includes/footer.jsp" %>    