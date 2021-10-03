db.customer.aggregate([ 
	{$match: {name: "ahmet", lastName: "ozkesek", grade: "engineer"}}, 
	{$group: {_id: "$age", sum_age: {$sum: "$age"}, avg_income: { $avg: "$income"}}}
])
