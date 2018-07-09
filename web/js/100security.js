//by: Marcos Henrique
//Site: www.100security.com.br

	var data = new Date();
	var ano = data.getFullYear();
	var mes = (data.getMonth() +1);
	var dia = data.getDate();
	
	var href = document.getElementById('data').getAttribute('href');
	href = href.split('.');
	document.getElementById('data').setAttribute('href' , href[0] + ano + '-' + mes + '-' + dia + '.' + href[1] );

	var data2 = new Date();
	var ano = data2.getFullYear();
	var mes = (data2.getMonth() +1);
	var dia = data2.getDate();
	
	var href = document.getElementById('data2').getAttribute('href');
	href = href.split('.');
	document.getElementById('data2').setAttribute('href' , href[0] + ano + '-' + mes + '-' + dia + '.' + href[1] );

	var data3 = new Date();
	var ano = data3.getFullYear();
	var mes = (data3.getMonth() +1);
	var dia = data3.getDate();
	
	var href = document.getElementById('data3').getAttribute('href');
	href = href.split('.');
	document.getElementById('data3').setAttribute('href' , href[0] + ano + '-' + mes + '-' + dia + '.' + href[1] );

	var data4 = new Date();
	var ano = data4.getFullYear();
	var mes = (data4.getMonth() +1);
	var dia = data4.getDate();
	
	var href = document.getElementById('data4').getAttribute('href');
	href = href.split('.');
	document.getElementById('data4').setAttribute('href' , href[0] + ano + '-' + mes + '-' + dia + '.' + href[1] );

	var data5 = new Date();
	var ano = data5.getFullYear();
	var mes = (data5.getMonth() +1);
	var dia = data5.getDate();
	
	var href = document.getElementById('data5').getAttribute('href');
	href = href.split('.');
	document.getElementById('data5').setAttribute('href' , href[0] + ano + '-' + mes + '-' + dia + '.' + href[1] );

	var data6 = new Date();
	var ano = data6.getFullYear();
	var mes = (data6.getMonth() +1);
	var dia = data6.getDate();
	
	var href = document.getElementById('data6').getAttribute('href');
	href = href.split('.');
	document.getElementById('data6').setAttribute('href' , href[0] + ano + '-' + mes + '-' + dia + '.' + href[1] );

	var data7 = new Date();
	var ano = data7.getFullYear();
	var mes = (data7.getMonth() +1);
	var dia = data7.getDate();
	
	var href = document.getElementById('data7').getAttribute('href');
	href = href.split('.');
	document.getElementById('data7').setAttribute('href' , href[0] + ano + '-' + mes + '-' + dia + '.' + href[1] );

	var data8 = new Date();
	var ano = data8.getFullYear();
	var mes = (data8.getMonth() +1);
	var dia = data8.getDate();
	
	var href = document.getElementById('data8').getAttribute('href');
	href = href.split('.');
	document.getElementById('data8').setAttribute('href' , href[0] + ano + '-' + mes + '-' + dia + '.' + href[1] );

	var data9 = new Date();
	var ano = data9.getFullYear();
	var mes = (data9.getMonth() +1);
	var dia = data9.getDate();
	
	var href = document.getElementById('data9').getAttribute('href');
	href = href.split('.');
	document.getElementById('data9').setAttribute('href' , href[0] + ano + '-' + mes + '-' + dia + '.' + href[1] );

	var data10 = new Date();
	var ano = data10.getFullYear();
	var mes = (data10.getMonth() +1);
	var dia = data10.getDate();
	
	var href = document.getElementById('data10').getAttribute('href');
	href = href.split('.');
	document.getElementById('data10').setAttribute('href' , href[0] + ano + '-' + mes + '-' + dia + '.' + href[1] );

	var data11 = new Date();
	var ano = data11.getFullYear();
	var mes = (data11.getMonth() +1);
	var dia = data11.getDate();
	
	var href = document.getElementById('data11').getAttribute('href');
	href = href.split('.');
	document.getElementById('data11').setAttribute('href' , href[0] + ano + '-' + mes + '-' + dia + '.' + href[1] );

	var data12 = new Date();
	var ano = data12.getFullYear();
	var mes = (data12.getMonth() +1);
	var dia = data12.getDate();
	
	var href = document.getElementById('data12').getAttribute('href');
	href = href.split('.');
	document.getElementById('data12').setAttribute('href' , href[0] + ano + '-' + mes + '-' + dia + '.' + href[1] );

	var data13 = new Date();
	var ano = data13.getFullYear();
	var mes = (data13.getMonth() +1);
	var dia = data13.getDate();
	
	var href = document.getElementById('data13').getAttribute('href');
	href = href.split('.');
	document.getElementById('data13').setAttribute('href' , href[0] + ano + '-' + mes + '-' + dia );
	
	var data14 = new Date();
	var ano = data14.getFullYear();
	var mes = (data14.getMonth() +1);
	var dia = data14.getDate();
	
	var href = document.getElementById('data14').getAttribute('href');
	href = href.split('.');
	document.getElementById('data14').setAttribute('href' , href[0] + ano + '-' + mes + '-' + dia + '.' + href[1] );
	
	function reports() {
	var data = new Date();
	var ano = data.getFullYear();
	var mes = (data.getMonth() +1);
	var dia = data.getDate();
	window.open('ad-reports/ad-users/ad-users-'+ ano + '-' + mes + '-' + dia +'.html' ,'_blank');
	window.open('ad-reports/ad-admins/ad-admins-'+ ano + '-' + mes + '-' + dia +'.html' ,'_blank');
	window.open('ad-reports/ad-disabled/ad-disabled-'+ ano + '-' + mes + '-' + dia +'.html' ,'_blank');
	window.open('ad-reports/ad-lastlogon/ad-lastlogon-'+ ano + '-' + mes + '-' + dia +'.html' ,'_blank');
	window.open('ad-reports/ad-neverexpires/ad-neverexpires-'+ ano + '-' + mes + '-' + dia +'.html' ,'_blank');
	window.open('ad-reports/ad-groups/ad-groups-'+ ano + '-' + mes + '-' + dia +'.html' ,'_blank');
	window.open('ad-reports/ad-membergroups/ad-membergroups-'+ ano + '-' + mes + '-' + dia +'.html' ,'_blank');
	window.open('ad-reports/ad-ous/ad-ous-'+ ano + '-' + mes + '-' + dia +'.html' ,'_blank');
	window.open('ad-reports/ad-computers/ad-computers-'+ ano + '-' + mes + '-' + dia +'.html' ,'_blank');
	window.open('ad-reports/ad-servers/ad-servers-'+ ano + '-' + mes + '-' + dia +'.html' ,'_blank');
	window.open('ad-reports/ad-dcs/ad-dcs-'+ ano + '-' + mes + '-' + dia +'.html' ,'_blank');
	window.open('ad-reports/ad-gpos/ad-gpos-'+ ano + '-' + mes + '-' + dia +'.html' ,'_blank');
	window.open('ad-reports/ad-inventory/ad-inventory-'+ ano + '-' + mes + '-' + dia +'.html' ,'_blank');
	}