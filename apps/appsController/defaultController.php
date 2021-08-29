<?php
switch ($page_requested) {

	case "dashboard":
		include "dashboard.php";
		break;
	case "deconnecter":
		include "deconnection.php";
		break;
	case "administration":
		switch ($param2[0]) {
			case "inventaire":
				include "inventaire.php";
				break;	
			case "rapport":
				include "rapport.php";
				break;	
			case "agent":
				include "agentController.php";
				break;
			case "support":
				include "retrait.php";
				break;
			}
		break;
	case "operation":
		switch ($param2[0]) {
			case "credit":
				include "credit.php";
				break;	
			case "forfait":
				include "forfait.php";
				break;	
			case "transfert":
				include "transfert.php";
				break;
			case "retrait":
				include "retrait.php";
				break;
			case "historique":
				include "historique.php";
				break;
			}
		break;
	case "configurations":
		switch ($url_array[2]) {
			case "addresses":
				include "addressController.php";
				break;
			case "pays":
				include "paysController.php";
				break;
			case "categories":
				include "categoryController.php";
				break;
			case "ussd":
				include "ussdController.php";
				break;
			case "types_licences":
				include "typeController.php";
				break;	
			case "service":
				include "serviceController.php";
				break;	
			case "forfait":
				include "ussd.php";
				break;	
			}
	break;
	case "super":
		switch ($url_array[2]) {
			case "addLicence":
				include "addLicence.php";
				break;
			case "activer":
				include "activer.php";
				break;	
			case "bloquer":
				include "bloquer.php";
				break;	
			case "modifier":
				include "modifier.php";
				break;

			case "licence":
				include "licenceController.php";
				break;
			case "compagnies":
				include "compagnyController.php";
				break;	
			case "manager":
				include "managerController.php";
				break;	
			}
	break;
	case 'connecter':
		include "login.php";
		break;
	case "site":
		$storeUrl = urldecode($param2[0]);
		include "magasin_page.php";
		break;
	case "prix":
		include "prix_en_baisse_page.php";
		break;

	case "essai":
		include "essai.php";
		break;

	case "sousCategory":
		include "sub_category_page.php";
		break;
	case "category":
	case "famille":
	case "espace":
		include "category_page.php";
		break;

	case "search":
		include "product_search_page.php";
		break;

	case "sousFamille":
	case "subCategory":
	case "rayon":
		include "sub_category_page.php";
		break;
	case "product":
	case "article":
		include "product_page.php";
		break;

	case "imgView":
		include 'view_image.php';
		exit;
		break;

	case "contacter":
	case "contact":
		//include "contact.php";
		$view = "contact.phtml";
		break;

	case "sendMessage":
		include "contact.php";
		exit;
		break;

	case "customer":
	case $iniObj->serviceName:

		include "customer.php";
		break;

	case 'jsp':
		header("Content-Type: text/javascript");
		include(_JS_PATH . $url_array[2]);
		exit;
		break;
	case 'ajsp':
		header("Content-Type: text/javascript");
		include(_JS_A_PATH . $url_array[3]);
		exit;
		break;

	case 'corpCss':
		include(_CSS_PATH . $url_array[3]);
		exit;
		break;

	case 'design':
		$im = imagecreatefrompng(_IMG_PATH . $url_array[3]);
		header('Content-Type: image/png');
		imagepng($im);
		imagedestroy($im);
		exit;
		break;

	case 'xml':
		include(_LIB_PATH . "/xmlDataRequest.php");
		exit;
		break;

	case 'json':
		include(_LIB_PATH . "jsonDataRequest.php");
		exit;
		break;

	case "lang":
		$cntFile = "/change_lang.php";
		include _CONTROLER_PATH . $cntFile;
		exit;
		break;

	case "maintenance":
		include _VIEW_PATH . "maintenance.html";
		break;
		exit;

	case "testPunch":
		include "puchOutTest.php";
		exit;
		break;
	case "receivePunchOut":
		include "puchOutReceiveCart.php";
		exit;
		break;
	case "sendOrderPunchOut":
		include "puchOutTestOrder.php";
		exit;
		break;
	case "cgu":
		$view = "fr/politique_de_confidentialite.phtml";
		break;
	case "mentionslegales":
		$view = "fr/mentions_legales.phtml";
		break;

	case "professionnels":
		$view = $viewPath . "/" . $lib->lang . "/" . "professionnels.phtml";
		break;

	case "map-points":
		$view = $viewPath . "/" . $lib->lang . "/" . "map_points.phtml";
		break;

	case "equipe":
		$view = $viewPath . "/" . $lib->lang . "/" . "map_points.phtml";
		break;

	default:
	$view = "index.phtml";

	// $view = $viewPath . "/" . $lib->lang . "/" . "home_page_content.phtml";
	break;
}
