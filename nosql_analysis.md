Limitations of RDBMS-

Traditional relational databases like MySQL work best when data is well-structured and rarely changes. However, in a real-world product catalog, products often have very different attributes. For example, laptops need fields such as RAM, processor, and storage, while shoes require size, color, and material. In an RDBMS, handling such variations usually means creating multiple tables or adding many unused (NULL) columns, which makes the database design messy and inefficient.
Another major issue is frequent schema changes. Whenever a new product type is introduced, the database structure must be modified. These changes are not only time-consuming but can also cause system downtime and increase maintenance effort.


Section B: NoSQL Benefits (MongoDB)


MongoDB handles these challenges much more naturally. Since it is a document-based database, it allows products to be stored in flexible JSON-like documents. This means each product can have its own set of attributes without following a fixed schema. A laptop can store technical specifications, while a shoe can store size and color, all within the same collection.

MongoDB also allows embedding related data. Customer reviews can be stored directly inside the product document, which makes data retrieval faster and simpler. There is no need for complex joins, and the complete product information can be fetched in a single query.

Another important advantage of MongoDB is horizontal scalability. It can easily distribute data across multiple servers using sharding, making it suitable for large product catalogs and high user traffic. Overall, MongoDB offers flexibility, better performance, and easier scaling for modern applications.

Section C: Trade-offs of MongoDB


Despite its advantages, MongoDB is not always the best choice. One drawback is that it is not as strong as MySQL when it comes to complex transactions involving multiple tables. For systems where strict transactional consistency is critical, relational databases are often more reliable.

Another issue is the lack of strict schema enforcement. Since MongoDB allows flexible structures, there is a risk of storing inconsistent or poorly structured data if proper validation is not applied.
