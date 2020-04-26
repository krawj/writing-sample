<?xml version='1.0'?>

<!-- 
Copyright © 2004-2006 by Idiom Technologies, Inc. All rights reserved. 
IDIOM is a registered trademark of Idiom Technologies, Inc. and WORLDSERVER
and WORLDSTART are trademarks of Idiom Technologies, Inc. All other 
trademarks are the property of their respective owners. 

IDIOM TECHNOLOGIES, INC. IS DELIVERING THE SOFTWARE "AS IS," WITH 
ABSOLUTELY NO WARRANTIES WHATSOEVER, WHETHER EXPRESS OR IMPLIED,  AND IDIOM
TECHNOLOGIES, INC. DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING
BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
PURPOSE AND WARRANTY OF NON-INFRINGEMENT. IDIOM TECHNOLOGIES, INC. SHALL NOT
BE LIABLE FOR INDIRECT, INCIDENTAL, SPECIAL, COVER, PUNITIVE, EXEMPLARY,
RELIANCE, OR CONSEQUENTIAL DAMAGES (INCLUDING BUT NOT LIMITED TO LOSS OF 
ANTICIPATED PROFIT), ARISING FROM ANY CAUSE UNDER OR RELATED TO  OR ARISING 
OUT OF THE USE OF OR INABILITY TO USE THE SOFTWARE, EVEN IF IDIOM
TECHNOLOGIES, INC. HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. 

Idiom Technologies, Inc. and its licensors shall not be liable for any
damages suffered by any person as a result of using and/or modifying the
Software or its derivatives. In no event shall Idiom Technologies, Inc.'s
liability for any damages hereunder exceed the amounts received by Idiom
Technologies, Inc. as a result of this transaction.

These terms and conditions supersede the terms and conditions in any
licensing agreement to the extent that such terms and conditions conflict
with those set forth herein.

This file is part of the DITA Open Toolkit project. 
See the accompanying LICENSE file for applicable license.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:opentopic-mapmerge="http://www.idiominc.com/opentopic/mapmerge"
    xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function"
    xmlns:related-links="http://dita-ot.sourceforge.net/ns/200709/related-links"
    xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="dita-ot opentopic-mapmerge opentopic-func related-links xs"
    version="2.0">
  
  <xsl:template name="insertLinkShortDesc">
    <xsl:param name="destination"/>
    <xsl:param name="element"/>
    <xsl:param name="linkScope"/>
    <xsl:choose>
      <!-- User specified description (from map or topic): use that. -->
      <xsl:when test="*[contains(@class,' topic/desc ')] and
        processing-instruction()[name()='ditaot'][.='usershortdesc']">
        <fo:block xsl:use-attribute-sets="link__shortdesc">
          <xsl:apply-templates select="*[contains(@class, ' topic/desc ')]"/>
        </fo:block>
      </xsl:when>
      <!-- External: do not attempt to retrieve. -->
      <xsl:when test="$linkScope='external'">
      </xsl:when>
      <!-- When the target has a short description and no local override, use the target -->
      <xsl:when test="$element/*[contains(@class, ' topic/shortdesc ')]">
        <xsl:variable name="generatedShortdesc" as="element()*">
          <xsl:apply-templates select="$element/*[contains(@class, ' topic/shortdesc ')]"/>
        </xsl:variable>
        <fo:block-container xsl:use-attribute-sets="link__shortdesc">
          <xsl:apply-templates select="$generatedShortdesc" mode="dropCopiedIds"/>
        </fo:block-container>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
