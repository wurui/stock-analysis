<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:oxm="https://www.openxsl.com">
<!--还是先放弃这么用吧
    <xsl:template match="*" name="percent">
        <xsl:param name="delta"/>
        <xsl:choose>
            <xsl:when test="$delta &gt; 0">
                <em class="percent positive">+<xsl:value-of select="format-number($delta,'0.00%')"/></em>
            </xsl:when>
            <xsl:otherwise>
                <em class="percent negative"><xsl:value-of select="format-number($delta,'0.00%')"/></em>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>-->
    <xsl:template match="/root" name="wurui.stock-analysis">
        <!-- className 'J_OXMod' required  -->
        <xsl:param oxm:type="href" name="linkto"/>
        
        <xsl:variable name="selectedsymbol" select="q/symbol"/>
        <div class="J_OXMod oxmod-stock-analysis" ox-mod="stock-analysis" data-linkto="{$linkto}">
            
            <table cellpadding="0" cellspacing="0" class="maintable">
                <tbody>
                    <xsl:for-each select="data/stock-analysis/i">
                        <xsl:variable name="delta" select="(close - med) div med"/>
                        <tr data-symbol="{normalize-space(symbol)}">
                            
                            <xsl:if test="symbol = $selectedsymbol">
                                <xsl:attribute name="class">selected</xsl:attribute>
                            </xsl:if>
                            <td><xsl:value-of select="symbol"/></td>
                            <td>
                                <xsl:value-of select="med"/>
                            </td>
                            <td align="right">
                                <xsl:value-of select="close"/>
                                
                                <xsl:choose>
                                    <xsl:when test="$delta &gt; 0">
                                        <em class="percent positive">+<xsl:value-of select="format-number($delta,'0.00%')"/></em>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <em class="percent negative"><xsl:value-of select="format-number($delta,'0.00%')"/></em>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
          </div>

    </xsl:template>

</xsl:stylesheet>
