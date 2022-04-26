<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="toWhomIsConcerned">
<table cellspacing="0" cellpadding="5" border="0">
	<tr>
		<td>
			<xsl:for-each select="notification_data">
				<p style="display:block; font-size:1.17em; margin-left:0; margin-right:0;">
				    @@dear@@&#160;<xsl:value-of select="receivers/receiver/user/first_name"/>
				</p>
			</xsl:for-each>
		</td>
	</tr>
</table>
</xsl:template>

</xsl:stylesheet>
