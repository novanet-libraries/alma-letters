<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl">

<xsl:template name="generalStyle">
 <style>
 body {@@language_related_body_css@@ background-color:#fff}
 .listing td {border-bottom: 1px solid #eee}
 .listing tr:hover td {background-color:#eee}
 .listing th {background-color:#f5f5f5 }
 h1{background-color:#e9e9e9;  line-height: 1.3em; margin: 0.1em 0;}
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
width:100%; text-shadow:1px 1px 1px #fff;
</xsl:template>

<xsl:template name="footerTableStyleCss">
background-color:#444;  width:100%; text-shadow:1px 1px 1px #333; color:#fff; margin-top:1em;  font-weight:700; line-height:1.5em; font-size:150%;
</xsl:template>

<xsl:template name="myAccountStyleCss">
<!-- change link to "button" look -->
background-color: #0075b0; padding: 0.4em; margin-top: 0.8em; border-radius: 0.2em; color: white; text-shadow:1px 1px 1px #333; box-shadow: 1px 1px 1px #00428c;
</xsl:template>


<!-- what follows are utilities used in several letters -->

<!-- Convert to lowercase -->
<xsl:template name="to-lowercase">
  <xsl:param name="text"/>
  <xsl:value-of select="translate($text, 'ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝ', 'abcdefghijklmnopqrstuvwxyzàáâãäåæçèéêëìíîïðñòóôõöøùúûüý')"/>
</xsl:template>

<!-- Remove accents/diacritics from previously lowercased text -->
<xsl:template name="remove-accents">
  <xsl:param name="text"/>
  <xsl:value-of select="translate($text, 'àáâãäåæçèéêëìíîïðñòóôõöøùúûüý', 'aaaaaaaceeeeiiiinoooooouuuuy')"/>
</xsl:template>

<xsl:template name="print-row-if-data-exists">
  <xsl:param name="data"/>
  <xsl:param name="label"/>
  
  <xsl:if test="normalize-space($data) != ''">
    <tr>
      <td>
        <xsl:if test="normalize-space($label) != ''">
          <strong>
            <xsl:value-of select="normalize-space($label)"/>
            <xsl:text>:&#160;</xsl:text>
          </strong>
        </xsl:if>
        <xsl:value-of select="normalize-space($data)"/>
      </td>
    </tr>
  </xsl:if>
</xsl:template>
  
<xsl:template name="yyyymmdd">
  <xsl:param name="inputDate"/>

  <!-- date portion -->
  <xsl:choose>
    <xsl:when test="substring($inputDate,3,1) ='/' and substring($inputDate,6,1) = '/' and translate(substring($inputDate,1,10),'1234567890/','') = ''">
       <!-- convert DD/MM/YYYY to YYYY-MM-DD -->
       <xsl:value-of select="concat(substring($inputDate,7,4),'-',substring($inputDate,4,2),'-',substring($inputDate,1,2))"/>
     </xsl:when>
     <xsl:otherwise>
       <xsl:value-of select="substring($inputDate,1,10)"/>
     </xsl:otherwise>
  </xsl:choose>

  <!-- time portion -->
  <xsl:choose>
    <xsl:when test="string-length(substring($inputDate,12)) > 3 and translate(substring($inputDate, 12, 4), '1234567890','') = ''">
      <!-- convert HHMM to HH:MM -->
      <xsl:value-of select="concat('&#160;', substring($inputDate,12,2), ':', substring($inputDate, 14, 2))"/> 
    </xsl:when>
    <xsl:when test="string-length(substring($inputDate,12)) > 4 and translate(substring($inputDate, 12, 5), '1234567890:','') = ''">
      <xsl:value-of select="concat('&#160;', substring($inputDate, 12, 5))"/>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template name="scannable-barcode">
  <xsl:param name="barcode" select=""/>
  <xsl:param name="imgname" select=""/>

  <xsl:text>&#160;</xsl:text>
  <span style="display:inline-block;white-space:nowrap;vertical-align:middle;font-size:400%;font-family:'Libre Barcode 39 Extended Text','Libre Barcode 39 Text','CarolinaBar-B39-2.5-22x158x720',Code39,'Bar-Code 39',monospace">
  <xsl:choose>
    <xsl:when test="normalize-space($imgname) != ''">
      <img src="{normalize-space($imgname)}" alt="{normalize-space($barcode)}"/>
    </xsl:when>  
    <xsl:otherwise>
      <xsl:value-of select="normalize-space($barcode)"/>
    </xsl:otherwise>
  </xsl:choose>
  </span>
  <xsl:text>&#160;</xsl:text>
</xsl:template>

<!-- Map province names to abbreviations -->
<xsl:template name="abbreviate-province">
  <xsl:param name="prov"/>

  <xsl:variable name="provinceMap">
    <province name="alberta" abbr="AB"/>
    <province name="british columbia" abbr="BC"/>
    <province name="manitoba" abbr="MB"/>
    <province name="new brunswick" abbr="NB"/>
    <province name="newfoundland and labrador" abbr="NL"/>
    <province name="northwest territories" abbr="NT"/>
    <province name="nova scotia" abbr="NS"/>
    <province name="nunavut" abbr="NU"/>
    <province name="ontario" abbr="ON"/>
    <province name="prince edward island" abbr="PE"/>
    <province name="quebec" abbr="QC"/>
    <province name="saskatchewan" abbr="SK"/>
    <province name="yukon" abbr="YT"/>

    <!-- French names, without accents -->
    <province name="colombie britannique" abbr="BC"/>
    <province name="terre neuve et labrador" abbr="NL"/>
    <province name="territoires du nord ouest" abbr="NT"/>
    <province name="nouvelle ecosse" abbr="NS"/>
    <province name="ile du prince edouard" abbr="PE"/>

    <!-- in case the abbreviations are just entered correctly in the first place -->
    <province name="ab" abbr="AB"/>
    <province name="bc" abbr="BC"/>
    <province name="mb" abbr="MB"/>
    <province name="nb" abbr="NB"/>
    <province name="nl" abbr="NL"/>
    <province name="nt" abbr="NT"/>
    <province name="ns" abbr="NS"/>
    <province name="nu" abbr="NU"/>
    <province name="on" abbr="ON"/>
    <province name="pe" abbr="PE"/>
    <province name="qc" abbr="QC"/>
    <province name="sk" abbr="SK"/>
    <province name="yt" abbr="YT"/>

    <!-- Informal/Alternative names -->
    <province name="newfoundland" abbr="NL"/>
    <province name="labrador" abbr="NL"/>
    <province name="nf" abbr="NL"/>
    <province name="terre neuve" abbr="NL"/>
    <province name="ne" abbr="NS"/>
    <province name="nwt" abbr="NT"/>
    <province name="pei" abbr="PE"/>
    <province name="pq" abbr="QC"/>
    <province name="yukon territory" abbr="YT"/>
  </xsl:variable>
  <xsl:variable name="provinceMapNodes" select="exsl:node-set($provinceMap)" />
  
  <xsl:variable name="lowercase">
    <xsl:call-template name="to-lowercase">
      <xsl:with-param name="text" select="normalize-space($prov)"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="noAccents">
    <xsl:call-template name="remove-accents">
      <xsl:with-param name="text" select="$lowercase"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="matchingProvince" select="$provinceMap/province[@name = $noAccents]"/>
  <xsl:choose>
    <xsl:when test="$matchingProvince">
      <xsl:value-of select="$matchingProvince/@abbr"/>
    </xsl:when>
    <xsl:otherwise>
      <!-- return original input if we couldn't map it to an abbreviation -->
      <xsl:value-of select="$prov"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="postal-address">
  <xsl:param name="name"/>
  <xsl:param name="address"/>
  <table role='presentation'>
    <xsl:call-template name="print-row-if-data-exists">
      <xsl:with-param name="data" select="$name"/>
    </xsl:call-template>
    <xsl:call-template name="print-row-if-data-exists">
      <xsl:with-param name="data" select="$address/line1"/>
    </xsl:call-template>
    <xsl:call-template name="print-row-if-data-exists">
      <xsl:with-param name="data" select="$address/line2"/>
    </xsl:call-template>
    <xsl:call-template name="print-row-if-data-exists">
      <xsl:with-param name="data" select="$address/line3"/>
    </xsl:call-template>
    <xsl:call-template name="print-row-if-data-exists">
      <xsl:with-param name="data" select="$address/line4"/>
    </xsl:call-template>
    <xsl:call-template name="print-row-if-data-exists">
      <xsl:with-param name="data" select="$address/line5"/>
    </xsl:call-template>
    <tr>
      <td>
        <xsl:value-of select="normalize-space($address/city)"/>
        <xsl:text>&#160;</xsl:text>
        <xsl:call-template name="abbreviate-province">
          <xsl:with-param name="prov" select="$address/state_province"/> 
        </xsl:call-template>
        <xsl:text>&#160;</xsl:text>
        <xsl:value-of select="normalize-space($address/postal_code)"/>
      </td>
    </tr>
    <xsl:if test="$address/country != 'CAN'">
      <xsl:call-template name="print-row-if-data-exists">
        <xsl:with-param name="data" select="$address/country_display"/>
      </xsl:call-template>
    </xsl:if>
  </table>
  
</xsl:template>

</xsl:stylesheet>
