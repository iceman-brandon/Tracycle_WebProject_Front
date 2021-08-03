<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
   <title>지구를 위한 Tracycle</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   	<!--한글폰트 링크 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&family=Nanum+Myeongjo:wght@400;700&family=Song+Myung&display=swap" rel="stylesheet">
   
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300&display=swap" rel="stylesheet">
	
    <link rel="stylesheet" href="../css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="../css/animate.css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../css/magnific-popup.css">
    <link rel="stylesheet" href="../css/aos.css">
    <link rel="stylesheet" href="../css/ionicons.min.css">
    <link rel="stylesheet" href="../css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../css/jquery.timepicker.css">
    <link rel="stylesheet" href="../css/flaticon.css">
    <link rel="stylesheet" href="../css/icomoon.css">
    <link rel="stylesheet" href="../css/fancybox.min.css">

    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/style.css">

  </head>
  <body>

   <jsp:include page="../header.jsp"></jsp:include>
  
  
  <div id="blog" class="site-section">
    <div class="container">
            
            <div class="row">
            <div class=" col-md-12 mb-3">
		           <div class="comment-form-wrap pt-5">
                    <h3 class="mb-3">  <label for="name" class="label-font-bold">제목</label> <input type="text" class="form-control" v-model="board.title"></h3>
                    <form action="#" class="">
                      <div class="form-group right">	
                        <h6><label for="name" class="label-font-bold">작성자 아이디</label> <a>{{userId}}</a></h6>
                      </div>
                      <div class="form-group">
                        <h6><label for="content" class="label-font-bold">내용</label></h6>
                        <textarea name="" id="content" cols="30" rows="20" class="form-control" v-model="board.content"></textarea>
                      </div>
                      <div class="form-group">
                      	<select class="selectpicker" name="selectedArea" v-model="area.areaId">
					    		<option v-for="sarea in areaList" :value="sarea.areaId">
					    			{{sarea.areaName}}
					    		</option>
					    </select>
                      	<!-- 
                      	
                        <label for="content" class="label-font-bold">지역 </label><br>
						    <select class="selectpicker" name="selectedArea" v-model="area.areaId">
					    		<option v-for="sarea in areaList" :value="sarea.areaId">
					    			{{sarea.areaName}}
					    		</option>
					    	</select>
                      	 -->
                      </div>
                      <div class="form-group">
                        <label for="content" class="label-font-bold">카테고리</label><br>
						    <select class="selectpicker" name="selectedCategory" v-model="category.categoryId">
					    		<option v-for="scategory in categoryList" :value="scategory.categoryId">
					    			{{scategory.categoryName}}
					    		</option>
					    	</select>
                      </div>
                      <!-- 
                      </div>
                       <div class="form-group">
                        <label for="content" class="label-font-bold">카테고리</label><br>
						    <select class="" name="selectedCategory" v-model="category.categoryId">
					    		<option v-for="scategory in categoryList" :value="scategory.categoryId">
					    			{{scategory.categoryName}}
					    		</option>
					    	</select>
                      </div>
                       --> 
                      
                      <div class="form-group">
                        <label for="content" class="label-font-bold">나눔 상태</label><br>
						    <select class="selectpicker" v-model="board.status">
 							   <option data-content="<span class='badge badge-pill badge-warning'>나눔대기</span>" :value=1>나눔대기</option>
 							   <option data-content="<span class='badge badge-pill badge-success'>나눔진행</span>" :value=2>나눔진행</option>
 							   <option data-content="<span class='badge badge-pill badge-danger'>나눔중단</span>" :value=3>나눔대기</option>
 							   <option data-content="<span class='badge badge-pill badge-end'>나눔완료</span>" :value=4>나눔완료 </option>
  							</select>
                      </div>
                    
                
					<div class="form-group">
					 <h6> <label for="formFile" class="form-label label-font-bold">대표 이미지</label></h6>
					  <input class="form-control" type="file" id="formFile" ref="mainFile" v-on:change="mainFileUpload()">
					</div>
					<div class="form-group">
					 <h6> <label for="formFile" class="form-label label-font-bold">이미지 (최대 4장)</label></h6>
					  <input class="form-control" multiple="multiple" type="file" id="formFile" ref="subFile" v-on:change="subFileUpload()">
					</div>
					
					
					 <!-- 작성시 게시글 작성 버튼 -->
					  <div class="form-group text-center pt-5 pb-5">
					  	<input type="submit" value="Cancel" class="btn py-3 px-4 btn-cancel">	
                        <input type="button" v-on:click="submitPost()" value="Write Post" class="btn py-3 px-4 btn-primary">
                      </div>
                      <!-- 수정시 게시글 수정 버튼 -->
					  <!-- <div class="form-group text-center pt-5 pb-5">
                        <input type="submit" value="Cancel" class="btn py-3 px-4 btn-cancel">
                        <input type="submit" value="Update Post" class="btn py-3 px-4 btn-primary">
                      </div> -->
                    </form>
                  </div>
			    	
            </div>

          </div>
  </div>
  </div>
  

<jsp:include page="../footer.jsp"></jsp:include>

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

  <script src="../js/jquery.min.js"></script>
  <script src="../js/jquery-migrate-3.0.1.min.js"></script>
  <script src="../js/popper.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/jquery.easing.1.3.js"></script>
  <script src="../js/jquery.waypoints.min.js"></script>
  <script src="../js/jquery.stellar.min.js"></script>
  <script src="../js/owl.carousel.min.js"></script>
  <script src="../js/jquery.magnific-popup.min.js"></script>
  <script src="../js/bootstrap-datepicker.js"></script>

  <script src="../js/jquery.fancybox.min.js"></script>
  
  <script src="../js/aos.js"></script>
  <script src="../js/jquery.animateNumber.min.js"></script>
  <script src="../js/main.js"></script>\
  
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/js/bootstrap-select.min.js" integrity="sha512-yDlE7vpGDP7o2eftkCiPZ+yuUyEcaBwoJoIhdXv71KZWugFqEphIS3PU60lEkFaz8RxaVsMpSvQxMBaKVwA5xg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/css/bootstrap-select.min.css" integrity="sha512-ARJR74swou2y0Q2V9k0GbzQ/5vJ2RBSoCWokg4zkfM29Fb3vZEQyv0iWBMW/yvKgyHSR/7D64pFMmU8nYmbRkg==" crossorigin="anonymous" referrerpolicy="no-referrer" />


<script>
	//const storage = window.sessionStorage;
	new Vue({
		el: "#blog",
		data(){
			return {
				board:{},
				areaList:[],
				categoryList:[],
				mainFile:[],
				subFile:[],
				user:{"userId":storage.getItem("login_user")},
				area:{},
				category:{},
				result:'',
				loading:true,
				errored:false,
				userId:storage.getItem("login_user")
			}
		},
		mounted(){
			axios
			.get('http://127.0.0.1:7788/board/getAllArea',{
 	  			headers : {
 	  				"jwt-auth-token":storage.getItem("jwt-auth-token")
 	  			}
 	  		})
			.then(response=>(this.areaList = response.data))
			.catch(error=>{
				alert(error);
				console.log(error);
				this.errored = true;
			})
			.finally(()=>this.loading = false),
			axios
			.get('http://127.0.0.1:7788/board/getAllCategory',{
 	  			headers : {
 	  				"jwt-auth-token":storage.getItem("jwt-auth-token")
 	  			}
 	  		})
			.then(response=>{this.categoryList = response.data;})
			.catch(error=>{
				alert(error);
				console.log(error);
				this.errored = true;
			})
			.finally(()=>this.loading = false)
		},
		methods:{
			
			mainFileUpload(){
				this.mainFile = this.$refs.mainFile.files[0];
				console.log(this.mainFile);
			},
			subFileUpload(){
				this.subFile = this.$refs.subFile.files;
				for(var i=0; i<this.subFile.length; i++) {
					console.log(this.subFile[i])
				}
			},
			submitPost(){
				var today = new Date();
				var year = today.getFullYear();
				var month = ('0' + (today.getMonth() + 1)).slice(-2);
				var day = ('0' + today.getDate()).slice(-2);
				var hours = today.getHours(); 
				var minutes = today.getMinutes(); 
				var seconds = today.getSeconds();
				var dateString = year + '-' + month  + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;
				const formData = new FormData();
				formData.append("title",this.board.title);
				formData.append("content",this.board.content);
				formData.append("areaId",this.area.areaId);
				formData.append("categoryId",this.category.categoryId);
				formData.append("viewCount",0);
				formData.append("userId",this.userId);
				formData.append("date",dateString);
				formData.append("status",this.board.status);
				formData.append("mainFile",this.mainFile)
				for(var i=0; i<this.subFile.length; i++) {
					formData.append("file", this.subFile[i]);
				}
				for(var key of formData.entries()) {
					console.log(key[0]+', '+key[1]);
				}
				
				axios.post('http://127.0.0.1:7788/board/writeBoard', formData,
						{headers:{ 'Content-Type': 'multipart/form-data' }})
				.then(response=>{
					this.result= response.data
				}).catch(error=>{
					console.log(error);
                    this.errored = true
				})
				.finally(()=>location.href="board_list.jsp")
			}
			
		}
	})

</script>
</body>
</html>