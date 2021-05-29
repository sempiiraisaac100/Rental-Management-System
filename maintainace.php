<?php
$app_name = 'RENTAL MANAGEMENT';
	$currDir = dirname(__FILE__);
	include("{$currDir}/defaultLang.php");
	include("{$currDir}/language.php");
	include("{$currDir}/lib.php");
	include_once("{$currDir}/header.php");

	$adminConfig = config('adminConfig');
	if($_POST['request']){
		include("libs/db_connect.php");
		$roomNo = $_POST['roomNo'];
		$description = $_POST['description'];
		$id = getLoggedMemberID();
		$status ="NOT SERVICED";
	$insert ="INSERT INTO maintance_requests VALUES ('','$id','$description','$roomNo','$status')";
	if ($result=mysqli_query($con,$insert)) {
		
	}
	}
	?>
<div class="panel-heading"><h3 class="panel-title">
	<strong></strong>
	<div class="hidden-print pull-center">
		<h1>Maintenance Request Form</h1>
	</div>
	<div class="clearfix"></div>
</h3></div>

<div class="panel-body">
<form method="post">
	<fieldset class="form-horizontal">
	
		<div class="form-group" >
			<label class="control-label">Room Number</label>
			<div class="">
				<input class="span11" type="text" name="roomNo" required />
			</div>
		</div>
		<div class="form-group" >
			<label class="control-label">Repair Description </label>
			<div class="">
			<textarea class="col-xs-9" name ="description" rows = "" required></textarea>	
			</div>
		</div>
	
		<div class ="form-group">
		<input class ="btn btn-success" type="submit" value="submit" name="request"/>
		</div>
		
	</fieldset>
	</form>
</div>
<!-- child records -->

<script>
	$j(function(){
		/* prevent loading child records in multiple DVP */
		if($j('[id=houses-children]').length > 1) return;

		post(
			'parent-children.php', {
				ParentTable: 'houses',
				SelectedID: '<%%VALUE(id)%%>',
				Operation: 'show-children-printable'
			},
			'houses-children',
			'disable-element',
			'loading-element',
			apply_persisting_children
		);

		$j('form').on('click', '#children-tabs button[data-target]', function(){
			$j(this).toggleClass('active');
			persist_expanded_child($j(this).attr('id'));
		});
	})
</script>
