📌 Executive Summary
End-to-end data architecture and modeling solution developed for Adventure Works, transforming raw transactional data into a production-ready Business Intelligence environment using dbt and Power BI.

🛠️ Key Technical Implementations:
Layered dbt Architecture: Designed a clean multi-layer pipeline structured into Staging (data cleaning and casting), Intermediate (business logic and joins), and Marts (final analytical presentation layer).

Dimensional Modeling (Star Schema & Bridge):

Developed the core fact table fct_orders at the line-item level (order_item_sk) incorporating proportional freight and tax allocation logic.

Implemented bridge_order_reasons to handle N:N (many-to-many) relationships between orders and sales motives without double-counting revenue.

Built star-schema dimensions: dim_customers, dim_products, dim_territories, dim_credit_cards, dim_dates, and dim_reasons.

Data Quality & Governance: Configured automated dbt data tests (unique, not_null, relationships, accepted_values) and established granular schema documentation using dedicated .yml files per model.

Semantic Layer & Power BI Optimization:

Modeled star-schema relationships with explicit cross-filter directions and cardinality controls.

Curated DAX measures grouped into structured Display Folders with field parameters for dynamic report slicing.
