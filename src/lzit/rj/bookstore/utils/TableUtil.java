package lzit.rj.bookstore.utils;

/**  
* Description:  
* @author Chenzhiwen  
* @date 2018年12月31日 下午12:04:34 
*/
public class TableUtil {
	public static String getCol(String type, String trid, String name, String url, String display) {
		String html = "";
		if (type.equals("A")) {
			html = "<table width=\"151\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"> \n"
					+ "<tr>\n" + "<td><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n"
					+ "<tr>\n" + "<td height=\"23\" background=\"images/main_47.gif\" id=\"imgmenu" + trid
					+ "\" class=\"menu_title\" onmouseover=\"this.className='menu_title2';\" onclick=\"showsubmenu("
					+ trid
					+ ")\" onmouseout=\"this.className='menu_title';\" style=\"cursor:hand\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n"
					+ "<tr>\n" + "<td width=\"18%\">&nbsp;</td>\n" + "<td width=\"82%\" class=\"STYLE1\">" + name
					+ "</td>\n" + "</tr>\n" + "</table></td>\n" + "</tr>";
		}

		if (type.equals("B")) {
			html = "<tr> \n"
					+ "<td height=\"23\"><div align=\"center\"><img src=\"images/left.gif\" width=\"10\" height=\"10\" /></div></td> \n"
					+ "<td height=\"23\"><table width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> \n"
					+ "<tr> \n"
					+ "<td height=\"20\" style=\"cursor:hand\" onmouseover=\"this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; \"onmouseout=\"this.style.borderStyle='none'\"   onClick=\"go('"
					+ url + "')\" ><span class=\"STYLE3\">" + name + "</span></td> \n" + "</tr> \n" + "</table></td> \n"
					+ "</tr>";
		}

		if (type.equals("C")) {
			html = "<tr> \n" + "<td background=\"images/main_51.gif\" id=\"submenu" + trid + "\" style=\"display:"
					+ display + "\" ><div class=\"sec_menu\" > \n"
					+ "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> \n" + "<tr> \n"
					+ "<td><table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">";
		}

		if (type.equals("D")) {
			html = "</table></td> \n" + "</tr> \n" + "<tr> \n"
					+ "<td height=\"5\"><img src=\"images/main_52.gif\" width=\"151\" height=\"5\" /></td> \n"
					+ "</tr> \n" + "</table> \n" + "</div></td> \n" + "</tr> \n" + " </table></td> \n" + "</tr> \n"
					+ "</table>";
		}
		return html;
	}

	

}
