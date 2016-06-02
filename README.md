# XSL DDRMenu Templates
This project contains different types of **xsl templates** for the **DDRMenu navigation provider** in [**DotNetNuke**](http://www.dnnsoftware.com/). It's based on the [**XMLTools-NavigationServices**](https://github.com/omanshardt/XMLTools-NavigationServices) project and contains *XSL(T)* files for the following usecases.

- Sitemaps,
- Child routes of current page, 
- Classic navigations
- Breadcrumb navigations
- Branch
- Single level
- All pages at one level
- Any other type of navigation with little customization

This is meant as a starting point for customization but it also can be used out of the box. 

The *XSL(T)* files provide minimalistic output (nested) html ul-list structures that is easy to understand and customize.
Beside showing the requested navigation outline these files also assign classnames to specific li-elements to make css styling more easy:
- **first:** first li-element in an ul-list
- **last:** last li-element in an ul-list
- **active:** current page is a child of the li-element that represent's this page
- **current:** current page matches the page that is represented by this li-element

The underlying data structure is provided by the DDRMenu navigation provider as an xml.


#### sitemap.xsl
This *XSL(T)* file provides a complete sitemap with all pages in their hierarchical order as nested html ul lists. It can be used if the website consists of only a few pages or if you want to provide a sitemap on a special sitemap page. With specific css styles applied it also can be used to provide a menu-like navigation with horizontal or vertical root level pages and vertical sub-levels.

#### classic.xsl
This *XSL(T)* file provides all root level pages with the current page's branch expanded up to the current page's child pages. This is a very common (and classic) way to display a site navigation.

#### singlelevel.xsl
This *XSL(T)* file provides the current page and it's siblings if the current page is at the specified level or the ancestor of the current page at the specified level and it's siblings if the current page is at a deeper level then specified. This allows to place the different levels of the navigation independently at different locations on the page.

The **singlelevel.xsl** needs the level to be dispayed either as passed in variable with name *level* or as default value for the variable *level* within the *XSL(T)* file.

#### children.xsl
This *XSL(T)* file provides all children of the current page.

#### branch.xsl
This *XSL(T)* file provides a branch of the sitemap starting from the current page.

#### breadcrumb_….xsl
This *XSL(T)* files provide a breadcrumb navigation that is only the current page and it's ancestors. **breadcrumb_nested.xsl** provides the nested pages in nested html ul lists that can be considered as some kind of oversized for the standard purpose. **breadcrumb_flat_list.xsl** provides the nested pages as flat html ul list what makes html markup a little bit more streamlined. **breadcrumb_flat_list.xsl** simply provides anchor tags separated by „>“ what is sufficient for most usecases.

#### level.xsl
This *XSL(T)* file provides **all** pages at the specified level no matter if they are siblings of current page or one of it's ancestors or not.

The **level.xsl** needs the level to be dispayed either as passed in variable with name *level* or as default value for the variable *level* within the *XSL(T)* file.
