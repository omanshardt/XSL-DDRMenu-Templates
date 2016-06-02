<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output media-type="text/html" method="html" indent="yes" encoding="utf-8" omit-xml-declaration="yes" />


	<xsl:variable name="upid">
		<xsl:value-of select="descendant-or-self::node[@selected='1']/@id" />
	</xsl:variable>

	<xsl:variable name="currentTabDepth">
		<xsl:value-of select="descendant-or-self::node[@id = $upid]/@depth" />
	</xsl:variable>


	<xsl:template match="/*">
		<xsl:apply-templates select="root" />
	</xsl:template>
	<xsl:template match="root">
		<ul>
			<xsl:apply-templates select="node" />
		</ul>
	</xsl:template>

	<xsl:template match="node">
		<li>
			<xsl:attribute name="class">
				<xsl:if test="@first = 1"> first</xsl:if>
				<xsl:if test="@last = 1"> last</xsl:if>
				<xsl:if test="descendant::node[@id=$upid]"> active</xsl:if>
				<xsl:if test="@id=$upid"> current</xsl:if>
			</xsl:attribute>
			<xsl:choose>
				<xsl:when test="@enabled = 1">
					<a>
						<xsl:attribute name="href"><xsl:value-of select="@url" /></xsl:attribute>
						<xsl:if test="@target != '_self'">
							<xsl:attribute name="target"><xsl:value-of select="@target" /></xsl:attribute>
						</xsl:if>
						<xsl:value-of select="@text" />
					</a>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="@text" />
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="node and descendant-or-self::node[@id=$upid]">
				<ul>
					<xsl:apply-templates select="./node" />
				</ul>
			</xsl:if>
		</li>
	</xsl:template>

</xsl:stylesheet>
