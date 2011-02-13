/*	
	Primo Admin
	Stefano Giliberti, kompulsive@gmail.com - lessbit.com	
*/

jQuery(document).ready(function(){
	
	/* Tabs */
	jQuery("ul.tabs").idTabs();

	/* Side Subsections Accordion */
	jQuery("#sub-menu ul").hide();
	jQuery("#sub-menu h3.selected").next("ul").slideDown("slow");
	jQuery("#sub-menu h3").click(function() {
		jQuery(this).next("ul")
		.slideToggle(500)
		.siblings("ul:visible").slideUp(1000);
		jQuery(this).toggleClass("selected");
		jQuery(this).siblings("h3").removeClass("selected");
	});

	/*** Alternates row colors! ***/
	jQuery("tr:even:not(.table-header)").css("background-color", "#f9f9f9");

	/* Elements closing system */
	jQuery(".canhide").append("<div class='close'></div>").css("position", "relative");
	jQuery(".close").click(function() {
		jQuery(this).hide();
		jQuery(this).parent().slideUp(300);
	});

//
//	Close button on mouseover
//
//	jQuery(".close").css("display", "none");
//  	jQuery(".canhide").hover(
//      function () {
//        jQuery(this).find(".close").show();
//      }, 
//      function () {
//        jQuery(this).find(".close").fadeTo(2000, 1, function(){
//    		jQuery(this).hide();
//  		});
//      }
//    ).dblclick(function() {
//    	jQuery(this).slideUp(300);
//    });
	
	/* Active tab style fix */
	jQuery("ul.tabs li a.selected").parent("li").addClass("selected");
	jQuery("ul.tabs li a").click(function() {
		jQuery("ul.tabs li").removeClass("selected");
		jQuery(this).parent("li").addClass("selected");
	});
	
});