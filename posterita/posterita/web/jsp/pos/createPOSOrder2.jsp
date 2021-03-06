<%--
 *  Product: Posterita Web-Based POS and Adempiere Plugin
 *  Copyright (C) 2007  Posterita Ltd
 *  This file is part of POSterita
 *  
 *  POSterita is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License along
 *  with this program; if not, write to the Free Software Foundation, Inc.,
 *  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * @author Vishee
--%>

<!-- createPOSOrder2.jsp -->

<%@ page import="org.posterita.user.*" %>
<%@ page import="org.posterita.Constants" %>


<%@ page import="org.posterita.struts.pos.POSOrderAction" %>
<%@ page import="org.posterita.beans.ProductBean" %>
<%@ page import="org.posterita.user.WebUserInfo" %>
<%@ page import="org.posterita.lib.UdiConstants" %>
<%@ page import="org.compiere.model.MOrder" %>


<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>	
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/dcs.tld" prefix="dcs" %>
<%@ taglib uri="/WEB-INF/pos.tld" prefix="pos"%>

<bean:define id="title"><pos:message textOnly="true" key="smenu.cash.sales.customer.complusory"/></bean:define>
<%@ include file="/jsp/include/posHeader.jsp" %>   
<%@ include file="/jsp/include/errors.jsp" %> 

	  						   	
<html:form action="/AddToPOSShoppingCartAction2" focus="productQuery">
	<html:hidden property="orderType" value="<%=Constants.POS_ORDER_CUSTOMER_COMPULSORY%>"/>
	<%@ include file="/jsp/include/posOrderWithAdvancedFocusSearch.jsp" %>
</html:form>

<%@ include file="/js/createPOSOrder.js" %>


<script>	
	function createOrder()
	{		
		setAction(document.forms[0],'CreatePOSOrderAction2.do','createPOSOrder');
		disableButtons();
	}	
  
	function focusBarcode()
	{
		document.getElementsByName('barCode')[0].focus();
		toConsole("Setting focus to barcode");
	}
	
	function validatePIN()
	{
		var pin  = PIN.value;		
		var url  = 'GetPOSPaymentDetailsAction.do';
		var pars = 'action=validateAdvanceOrderPIN2&userPIN=' + pin;
		
		var myAjax = new Ajax.Request( url, 
		{ 
			method: 'get', 
			parameters: pars, 
			onSuccess: evaluateResponse, 
			onFailure: reportError
		});
		
		disablePIN();
	}
	
	function createCustomer()
	{
		window.location = "InitCreatePOSCustomer.do?action=initCreatePOSCustomer&creatingFromOrder=posOrderCustomerCompulsory";
	}	
	
	addRequiredLibrary('js/keyboard.js');
	addRequiredLibrary('js/pin.js');
	
	
</script>
 
<%@ include file="/jsp/include/posFooter.jsp" %>      
   
