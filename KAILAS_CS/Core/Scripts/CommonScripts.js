
/* 
// @File        : CommonScripts.js
// @Date        : 14-JAN-2015
// @Author      : AK
// @Depends     : 
// @Class       : 
// @Extends     : 
// @Description : Class which handles the user's password Common Scripts
** Revision History:
    
Date: 14-Jan-2014
Author: AK
Changes: Created 
_______________________________
   
Date: 
Author: 
Changes: 
_______________________________
**
*/
//$(document).ready(function () {
    $('[data-toggle="tooltip"]').tooltip();

    function PopupDialog(message) {
        bootbox.alert(message, function () {
        });
    };
//});