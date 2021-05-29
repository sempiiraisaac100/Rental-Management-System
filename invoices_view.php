<?php
// This script and data application were generated by AppGini 5.71
// Download AppGini for free from https://bigprof.com/appgini/download/

	$currDir=dirname(__FILE__);
	include("$currDir/defaultLang.php");
	include("$currDir/language.php");
	include("$currDir/lib.php");
	@include("$currDir/hooks/invoices.php");
	include("$currDir/invoices_dml.php");

	// mm: can the current member access this page?
	$perm=getTablePermissions('invoices');
	if(!$perm[0]){
		echo error_message($Translation['tableAccessDenied'], false);
		echo '<script>setTimeout("window.location=\'index.php?signOut=1\'", 2000);</script>';
		exit;
	}

	$x = new DataList;
	$x->TableName = "invoices";

	// Fields that can be displayed in the table view
	$x->QueryFieldsTV = array(   
		"`invoices`.`id`" => "id",
		"IF(    CHAR_LENGTH(`tenants1`.`fullname`) || CHAR_LENGTH(`tenants1`.`national_id`), CONCAT_WS('',   `tenants1`.`fullname`, ' ID: ', `tenants1`.`national_id`), '') /* Tenant */" => "tenant",
		"IF(    CHAR_LENGTH(`tenants1`.`phone_number`), CONCAT_WS('',   `tenants1`.`phone_number`), '') /* Phone */" => "phone",
		"IF(    CHAR_LENGTH(`houses1`.`house_number`), CONCAT_WS('',   `houses1`.`house_number`), '') /* House */" => "house",
		"`invoices`.`year`" => "year",
		"`invoices`.`month`" => "month",
		"`invoices`.`particulars`" => "particulars",
		"`invoices`.`total`" => "total",
		"`invoices`.`status`" => "status",
		"`invoices`.`comments`" => "comments"
	);
	// mapping incoming sort by requests to actual query fields
	$x->SortFields = array(   
		1 => '`invoices`.`id`',
		2 => 2,
		3 => '`tenants1`.`phone_number`',
		4 => 4,
		5 => 5,
		6 => 6,
		7 => 7,
		8 => 8,
		9 => 9,
		10 => 10
	);

	// Fields that can be displayed in the csv file
	$x->QueryFieldsCSV = array(   
		"`invoices`.`id`" => "id",
		"IF(    CHAR_LENGTH(`tenants1`.`fullname`) || CHAR_LENGTH(`tenants1`.`national_id`), CONCAT_WS('',   `tenants1`.`fullname`, ' ID: ', `tenants1`.`national_id`), '') /* Tenant */" => "tenant",
		"IF(    CHAR_LENGTH(`tenants1`.`phone_number`), CONCAT_WS('',   `tenants1`.`phone_number`), '') /* Phone */" => "phone",
		"IF(    CHAR_LENGTH(`houses1`.`house_number`), CONCAT_WS('',   `houses1`.`house_number`), '') /* House */" => "house",
		"`invoices`.`year`" => "year",
		"`invoices`.`month`" => "month",
		"`invoices`.`particulars`" => "particulars",
		"`invoices`.`total`" => "total",
		"`invoices`.`status`" => "status",
		"`invoices`.`comments`" => "comments"
	);
	// Fields that can be filtered
	$x->QueryFieldsFilters = array(   
		"`invoices`.`id`" => "ID",
		"IF(    CHAR_LENGTH(`tenants1`.`fullname`) || CHAR_LENGTH(`tenants1`.`national_id`), CONCAT_WS('',   `tenants1`.`fullname`, ' ID: ', `tenants1`.`national_id`), '') /* Tenant */" => "Tenant",
		"IF(    CHAR_LENGTH(`tenants1`.`phone_number`), CONCAT_WS('',   `tenants1`.`phone_number`), '') /* Phone */" => "Phone",
		"IF(    CHAR_LENGTH(`houses1`.`house_number`), CONCAT_WS('',   `houses1`.`house_number`), '') /* House */" => "House",
		"`invoices`.`year`" => "Year",
		"`invoices`.`month`" => "Month",
		"`invoices`.`particulars`" => "Particulars",
		"`invoices`.`total`" => "Total (Ush)",
		"`invoices`.`status`" => "Status",
		"`invoices`.`comments`" => "Comments"
	);

	// Fields that can be quick searched
	$x->QueryFieldsQS = array(   
		"`invoices`.`id`" => "id",
		"IF(    CHAR_LENGTH(`tenants1`.`fullname`) || CHAR_LENGTH(`tenants1`.`national_id`), CONCAT_WS('',   `tenants1`.`fullname`, ' ID: ', `tenants1`.`national_id`), '') /* Tenant */" => "tenant",
		"IF(    CHAR_LENGTH(`tenants1`.`phone_number`), CONCAT_WS('',   `tenants1`.`phone_number`), '') /* Phone */" => "phone",
		"IF(    CHAR_LENGTH(`houses1`.`house_number`), CONCAT_WS('',   `houses1`.`house_number`), '') /* House */" => "house",
		"`invoices`.`year`" => "year",
		"`invoices`.`month`" => "month",
		"`invoices`.`particulars`" => "particulars",
		"`invoices`.`total`" => "total",
		"`invoices`.`status`" => "status",
		"`invoices`.`comments`" => "comments"
	);

	// Lookup fields that can be used as filterers
	$x->filterers = array(  'tenant' => 'Tenant');

	$x->QueryFrom = "`invoices` LEFT JOIN `tenants` as tenants1 ON `tenants1`.`id`=`invoices`.`tenant` LEFT JOIN `houses` as houses1 ON `houses1`.`id`=`tenants1`.`house` ";
	$x->QueryWhere = '';
	$x->QueryOrder = '';

	$x->AllowSelection = 1;
	$x->HideTableView = ($perm[2]==0 ? 1 : 0);
	$x->AllowDelete = $perm[4];
	$x->AllowMassDelete = true;
	$x->AllowInsert = $perm[1];
	$x->AllowUpdate = $perm[3];
	$x->SeparateDV = 1;
	$x->AllowDeleteOfParents = 0;
	$x->AllowFilters = 1;
	$x->AllowSavingFilters = 1;
	$x->AllowSorting = 1;
	$x->AllowNavigation = 1;
	$x->AllowPrinting = 1;
	$x->AllowCSV = 1;
	$x->RecordsPerPage = 10;
	$x->QuickSearch = 1;
	$x->QuickSearchText = $Translation["quick search"];
	$x->ScriptFileName = "invoices_view.php";
	$x->RedirectAfterInsert = "invoices_view.php?SelectedID=#ID#";
	$x->TableTitle = "Invoices";
	$x->TableIcon = "resources/table_icons/card_money.png";
	$x->PrimaryKey = "`invoices`.`id`";

	$x->ColWidth   = array(  150, 150, 150, 150, 150, 150, 150, 150, 150);
	$x->ColCaption = array("Tenant", "Phone", "House", "Year", "Month", "Particulars", "Total (Ush)", "Status", "Comments");
	$x->ColFieldName = array('tenant', 'phone', 'house', 'year', 'month', 'particulars', 'total', 'status', 'comments');
	$x->ColNumber  = array(2, 3, 4, 5, 6, 7, 8, 9, 10);

	// template paths below are based on the app main directory
	$x->Template = 'templates/invoices_templateTV.html';
	$x->SelectedTemplate = 'templates/invoices_templateTVS.html';
	$x->TemplateDV = 'templates/invoices_templateDV.html';
	$x->TemplateDVP = 'templates/invoices_templateDVP.html';

	$x->ShowTableHeader = 1;
	$x->TVClasses = "";
	$x->DVClasses = "";
	$x->HighlightColor = '#FFF0C2';

	// mm: build the query based on current member's permissions
	$DisplayRecords = $_REQUEST['DisplayRecords'];
	if(!in_array($DisplayRecords, array('user', 'group'))){ $DisplayRecords = 'all'; }
	if($perm[2]==1 || ($perm[2]>1 && $DisplayRecords=='user' && !$_REQUEST['NoFilter_x'])){ // view owner only
		$x->QueryFrom.=', membership_userrecords';
		$x->QueryWhere="where `invoices`.`id`=membership_userrecords.pkValue and membership_userrecords.tableName='invoices' and lcase(membership_userrecords.memberID)='".getLoggedMemberID()."'";
	}elseif($perm[2]==2 || ($perm[2]>2 && $DisplayRecords=='group' && !$_REQUEST['NoFilter_x'])){ // view group only
		$x->QueryFrom.=', membership_userrecords';
		$x->QueryWhere="where `invoices`.`id`=membership_userrecords.pkValue and membership_userrecords.tableName='invoices' and membership_userrecords.groupID='".getLoggedGroupID()."'";
	}elseif($perm[2]==3){ // view all
		// no further action
	}elseif($perm[2]==0){ // view none
		$x->QueryFields = array("Not enough permissions" => "NEP");
		$x->QueryFrom = '`invoices`';
		$x->QueryWhere = '';
		$x->DefaultSortField = '';
	}
	// hook: invoices_init
	$render=TRUE;
	if(function_exists('invoices_init')){
		$args=array();
		$render=invoices_init($x, getMemberInfo(), $args);
	}

	if($render) $x->Render();

	// hook: invoices_header
	$headerCode='';
	if(function_exists('invoices_header')){
		$args=array();
		$headerCode=invoices_header($x->ContentType, getMemberInfo(), $args);
	}  
	if(!$headerCode){
		include_once("$currDir/header.php"); 
	}else{
		ob_start(); include_once("$currDir/header.php"); $dHeader=ob_get_contents(); ob_end_clean();
		echo str_replace('<%%HEADER%%>', $dHeader, $headerCode);
	}

	echo $x->HTML;
	// hook: invoices_footer
	$footerCode='';
	if(function_exists('invoices_footer')){
		$args=array();
		$footerCode=invoices_footer($x->ContentType, getMemberInfo(), $args);
	}  
	if(!$footerCode){
		include_once("$currDir/footer.php"); 
	}else{
		ob_start(); include_once("$currDir/footer.php"); $dFooter=ob_get_contents(); ob_end_clean();
		echo str_replace('<%%FOOTER%%>', $dFooter, $footerCode);
	}
?>