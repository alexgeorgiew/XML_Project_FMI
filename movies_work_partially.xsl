<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">

<xsl:template match="movies">
	<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<fo:layout-master-set>
		<fo:simple-page-master page-height="297mm" page-width="210mm" margin="5mm 25mm 5mm 25mm" master-name="PageMaster">
		<fo:region-body margin="20mm 0mm 20mm 0mm"/>
		</fo:simple-page-master>
	</fo:layout-master-set>
	<fo:page-sequence master-reference="PageMaster">
		<fo:flow flow-name="xsl-region-body">
			<fo:block>
				<fo:block>Hello World!</fo:block>
				<fo:block>This is the first
				<fo:inline font-weight="bold">SampleDoc</fo:inline>
				</fo:block>
			</fo:block>
			<!--<xsl:apply-templates select="movie"/>-->
			<xsl:for-each select="movie">
      				
        			<fo:block>
					Title:<xsl:value-of select="title"/>
				</fo:block>
			<fo:block>
                                      
					  <xsl:variable name="img" select="image" /> 
                                              <fo:external-graphic src="{$img}" height="2.00in" width="2.00in"/>
				    
				</fo:block>
			<fo:block>
					Year of production is :<xsl:value-of select="year"/>
				</fo:block>
			<fo:block>
					Genre is:<xsl:value-of select="genre"/>
				</fo:block>
			<fo:block>
					Production:<xsl:value-of select="production"/>
				</fo:block>
			<fo:block>
					Director is:<xsl:value-of select="directorref"/>
				</fo:block>
			<fo:block>
					Actors:<xsl:value-of select="movies-stars"/>
				</fo:block>
			</xsl:for-each>
		</fo:flow>
	</fo:page-sequence>
	</fo:root>
         
</xsl:template>

</xsl:stylesheet> 
