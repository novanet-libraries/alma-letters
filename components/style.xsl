<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="generalStyle">
 <style>
 body {@@language_related_body_css@@ background-color:#fff}
 .listing td {border-bottom: 1px solid #eee}
 .listing tr:hover td {background-color:#eee}
 .listing th {background-color:#f5f5f5 }
 h1{line-height: 0.2em; margin: 0.1em 0;}
 h4{line-height: 0.2em}
 </style>
</xsl:template>

<xsl:template name="bodyStyleCss">
font-family: arial; color:#333; margin:0; padding:0em; font-size:80% 
</xsl:template>

<xsl:template name="listStyleCss">
list-style: none; margin:0 0 0 1em; padding:0
</xsl:template>

<xsl:template name="mainTableStyleCss">
width:100%; text-align:left
</xsl:template>

<xsl:template name="headerLogoStyleCss">
background-color:#ffffff;  width:100%;
</xsl:template>

<xsl:template name="headerTableStyleCss">
background-color:#e9e9e9;  width:100%; text-shadow:1px 1px 1px #fff;
</xsl:template>

<xsl:template name="footerTableStyleCss">
background-color:#444;  width:100%; text-shadow:1px 1px 1px #333; color:#fff; margin-top:1em;  font-weight:700; line-height:1.5em; font-size:150%;
</xsl:template>

<xsl:template name="myAccountStyleCss">
<!-- change link to "button" look -->
background-color: #0075b0; padding: 0.4em; margin-top: 0.8em; border-radius: 0.2em; color: white; text-shadow:1px 1px 1px #333; box-shadow: 1px 1px 1px #00428c;
</xsl:template>

<xsl:template name="yyyymmdd">
  <xsl:param name="inputDate"/>

  <!-- date portion -->
  <xsl:choose>
    <xsl:when test="substring($inputDate,3,1) ='/' and substring($inputDate,6,1) = '/' and translate(substring($inputDate,1,10),'1234567890/','') = ''">
       <xsl:value-of select="concat(substring($inputDate,7,4),'-',substring($inputDate,4,2),'-',substring($inputDate,1,2))"/>
     </xsl:when>
     <xsl:otherwise>
      <xsl:value-of select="substring($inputDate,1,10)"/>
     </xsl:otherwise>
  </xsl:choose>

  <!-- time portion -->
  <xsl:choose>
    <xsl:when test="string-length(substring($inputDate,12)) > 3 and translate(substring($inputDate, 12, 4), '1234567890','') = ''">
      <xsl:value-of select="concat('&#160;', substring($inputDate,12,2), ':', substring($inputDate, 14, 2))"/> 
    </xsl:when>
    <xsl:when test="string-length(substring($inputDate,12)) > 4 and translate(substring($inputDate, 12, 5), '1234567890:','') = ''">
      <xsl:value-of select="concat('&#160;', substring($inputDate, 12, 5))"/>
    </xsl:when>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>
