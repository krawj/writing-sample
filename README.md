# Writing Sample

This repository contains the DITA source for a manual on getting started with the Git Client add-on for Oxygen XML Editor. The project was built in Oxygen XML Author 22.0 and serves as a writing sample for a technical writing portfolio.

## Output customizations

The project is configured to build basic PDF output through the **org.dita.pdf2** plugin with several minor customizations. The `custom/fo/attrs` and `custom/fo/xsl` directories contain contains several `.xsl` stylesheet files that override the default XSL-FO processing steps and styling attributes to change the page size, remove the blank page after each chapter, and more. 

## Buidling the default output

To build the output as-is, you need a version of Oxygen XML Editor that comes pre-bundled with DITA Open Tolkit 3.x or you need to configure Oxygen to use a custom DITA OT instance. 

1. Clone this repository and open the `writing-sample.xpr` file in Oxygen XML Editor.
2. Right-click the `.ditamap` file in the project root and select **Transform** → **Apply Transformation Scenario(s)**.

The output is saved to the `out/pdf` directory in the project root.
