<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="main" page-height="29.7cm" page-width="21cm" margin-top="1cm" margin-bottom="2cm" margin-left="1.5cm" margin-right="1.5cm">
                    <fo:region-body margin-top="2.5cm"/>
                    <fo:region-before extent="1cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="main">
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block-container>
                        <fo:block text-align="right" font-size="10pt" line-height="1.5">TPE 2024 1Q - Grupo 05</fo:block>
                    </fo:block-container>
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body">
                    <fo:block font-size="14pt" text-align="left" space-after.optimum="10pt" margin-left="0cm">
                        Drivers for <xsl:value-of select="nascar_data/serie_type"/> for <xsl:value-of select="nascar_data/year"/> season
                    </fo:block>
                    <fo:table table-layout="fixed" width="100%" border="1pt solid black" font-size="8pt">
                        <fo:table-column column-width="12%"/>
                        <fo:table-column column-width="10%"/>
                        <fo:table-column column-width="10%"/>
                        <fo:table-column column-width="12%"/>
                        <fo:table-column column-width="8%"/>
                        <fo:table-column column-width="7%"/>
                        <fo:table-column column-width="7%"/>
                        <fo:table-column column-width="7%"/>
                        <fo:table-column column-width="7%"/>
                        <fo:table-column column-width="10%"/>
                        <fo:table-column column-width="10%"/>
                        <fo:table-body>
                            <fo:table-row background-color="rgb(215,245,250)">
                                <fo:table-cell><fo:block text-align="center" wrap-option="wrap" linefeed-treatment="preserve" hyphenate="true">Name</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block text-align="center" wrap-option="wrap" linefeed-treatment="preserve" hyphenate="true">Country</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block text-align="center" wrap-option="wrap" linefeed-treatment="preserve" hyphenate="true">Birth date</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block text-align="center" wrap-option="wrap" linefeed-treatment="preserve" hyphenate="true">Birth place</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block text-align="center" wrap-option="wrap" linefeed-treatment="preserve" hyphenate="true">Car manufacturer</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block text-align="center" wrap-option="wrap" linefeed-treatment="preserve" hyphenate="true">Rank</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block text-align="center" wrap-option="wrap" linefeed-treatment="preserve" hyphenate="true">Season points</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block text-align="center" wrap-option="wrap" linefeed-treatment="preserve" hyphenate="true">Wins</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block text-align="center" wrap-option="wrap" linefeed-treatment="preserve" hyphenate="true">Poles</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block text-align="center" wrap-option="wrap" linefeed-treatment="preserve" hyphenate="true">Unfinished races</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block text-align="center" wrap-option="wrap" linefeed-treatment="preserve" hyphenate="true">Completed laps</fo:block></fo:table-cell>
                            </fo:table-row>
                            <xsl:for-each select="nascar_data/drivers/driver[number(rank) != 0]">
                                <xsl:sort select="number(rank)" order="ascending"/>
                                <fo:table-row>
                                    <fo:table-cell><fo:block text-align="center" wrap-option="wrap" linefeed-treatment="preserve" hyphenate="true"><xsl:value-of select="full_name"/></fo:block></fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block text-align="center" wrap-option="wrap" linefeed-treatment="preserve" hyphenate="true">
                                            <xsl:value-of select="concat(upper-case(substring(country, 1, 1)), lower-case(substring(country, 2)))"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell><fo:block text-align="center" wrap-option="wrap" linefeed-treatment="preserve" hyphenate="true"><xsl:value-of select="birth_date"/></fo:block></fo:table-cell>
                                    <fo:table-cell><fo:block text-align="center" wrap-option="wrap" linefeed-treatment="preserve" hyphenate="true"><xsl:value-of select="birth_place"/></fo:block></fo:table-cell>
                                    <fo:table-cell><fo:block text-align="center" wrap-option="wrap" linefeed-treatment="preserve" hyphenate="true"><xsl:value-of select="car"/></fo:block></fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block text-align="center" wrap-option="wrap" linefeed-treatment="preserve" hyphenate="true" color="{if (number(rank) le 3) then 'green' else 'black'}">
                                            <xsl:value-of select="rank"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell><fo:block text-align="center" wrap-option="wrap" linefeed-treatment="preserve" hyphenate="true"><xsl:value-of select="statistics/season_points"/></fo:block></fo:table-cell>
                                    <fo:table-cell><fo:block text-align="center" wrap-option="wrap" linefeed-treatment="preserve" hyphenate="true"><xsl:value-of select="statistics/wins"/></fo:block></fo:table-cell>
                                    <fo:table-cell><fo:block text-align="center" wrap-option="wrap" linefeed-treatment="preserve" hyphenate="true"><xsl:value-of select="statistics/poles"/></fo:block></fo:table-cell>
                                    <fo:table-cell><fo:block text-align="center" wrap-option="wrap" linefeed-treatment="preserve" hyphenate="true"><xsl:value-of select="statistics/races_not_finished"/></fo:block></fo:table-cell>
                                    <fo:table-cell><fo:block text-align="center" wrap-option="wrap" linefeed-treatment="preserve" hyphenate="true"><xsl:value-of select="statistics/laps_completed"/></fo:block></fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                        </fo:table-body>
                    </fo:table>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>
