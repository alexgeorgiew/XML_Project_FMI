<?xml version="1.0" encoding="UTF-8" ?>


<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:key name="directorById" match="director" use="@destination"/>
<xsl:key name="studioById" match="studio" use="@destination"/>

<xsl:template match="movies">
	<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<fo:layout-master-set>
		<fo:simple-page-master page-height="297mm" page-width="210mm" margin="5mm 25mm 5mm 25mm" master-name="PageMaster">
		<fo:region-body margin="20mm 0mm 20mm 0mm"/>
		</fo:simple-page-master>
	</fo:layout-master-set>
	<fo:page-sequence master-reference="PageMaster">
		<fo:flow flow-name="xsl-region-body">
			<fo:block> </fo:block>
			<xsl:for-each select="movie">
      				
        			<fo:block font-size="20pt">
					Title:<xsl:value-of select="title"/>
				</fo:block>
			<fo:block> 
					  <xsl:variable name="img" select="image" /> 
                                          <fo:external-graphic src="{$img}" content-height="scale-to-fit"  height="2.00in" width="2.00in"/>
				</fo:block>
			<fo:block>
					Year of production is :<xsl:value-of select="year"/>
				</fo:block>
			<fo:block>
					Genre is:<xsl:value-of select="genre"/>
				</fo:block>
			<fo:block>
					<xsl:apply-templates select="production"/>
				</fo:block>
			<fo:block>
					Director:<xsl:value-of select="key('directorById', directorref/@target)"/>
				</fo:block>
			<fo:block>	
					Actors:<xsl:apply-templates select="movie-stars"/>
				</fo:block>

			<fo:block>
					<fo:leader />
			</fo:block>
			
			</xsl:for-each>
		</fo:flow>
	</fo:page-sequence>
	</fo:root>
         
</xsl:template>

<xsl:template match="movie-stars">
	<xsl:for-each select="actor">
		<fo:block>
			<xsl:value-of select="name"/>
		</fo:block>
	</xsl:for-each>
</xsl:template>

<xsl:template match="production">
	<fo:block>
		Studio:<xsl:value-of select="key('studioById', studioref/@target)"/>
	</fo:block>
	<fo:block>
		Budget:<xsl:value-of select="cost"/>
	</fo:block>
</xsl:template>

</xsl:stylesheet> 
