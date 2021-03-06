data(Heteromys_anomalus_South_America)

# test rcpp_rarefy_algorithm function
test_that('SpRarefy: rcpp_rarefy_algorithm function doesn\'t work', {
	result<-spThin:::rcpp_rarefy_algorithm(
		split(
			seq_len(10),
			sample(rep(seq_len(5),2))
		),
		1
	)
})

# test that rarefy function makes the right sized grid
test_that('SpRarefy: rarefy function makes wrong size grid', {
	result<-spRarefy(
		Heteromys_anomalus_South_America[1:5,],
		x.col = "X", 
        y.col = "Y",
        10000,
		10
	)
	expect_equal(res(result@grid), c(10000,10000))
})


# test rarefy functions
test_that('SpRarefy: rarefy.data.frame function doesn\'t work', {
	result<-spRarefy(
		Heteromys_anomalus_South_America[1:5,],
		x.col = "X", 
        y.col = "Y",
        10000,
		10
	)
})

test_that('SpRarefy: rarefy.numeric function doesn\'t work', {
	result<-spRarefy(
		Heteromys_anomalus_South_America[1:5,"X"],
		Heteromys_anomalus_South_America[1:5,"Y"],
        10000,
		10
	)
})

# test methods
test_that('SpRarefy: [[ method doesn\'t work', {
	result<-spRarefy(
		Heteromys_anomalus_South_America,
		x.col = "X", 
        y.col = "Y",
        10000,
		10
	)
	x<-result[[1]]
})

test_that('SpRarefy: nrep method doesn\'t work', {
	result<-spRarefy(
		Heteromys_anomalus_South_America,
		x.col = "X", 
        y.col = "Y",
        10000,
		10
	)
	x=nrep(result)
})


test_that('SpRarefy: fulldata method doesn\'t work', {
	result<-spRarefy(
		Heteromys_anomalus_South_America,
		x.col = "X", 
        y.col = "Y",
        10000,
		10
	)
	x=fulldata(result)
})

test_that('SpRarefy: cellsize method doesn\'t work', {
	result<-spRarefy(
		Heteromys_anomalus_South_America,
		x.col = "X", 
        y.col = "Y",
        10000,
		10
	)
	x=cellsize(result)
})

test_that('SpRarefy: write.SpRarefy method doesn\'t work', {
	result<-spRarefy(
		Heteromys_anomalus_South_America,
		x.col = "X", 
        y.col = "Y",
        10000,
		10
	)
	x=write.SpRarefy(result, dir=tempdir())
})

# test summary method
test_that('summary method doesn\'t work', {
	result<-spRarefy(
		Heteromys_anomalus_South_America,
		x.col = "X", 
        y.col = "Y",
        10000,
		10
	)
	summary(result)
})

# test plot method
test_that('plot method doesn\'t work', {
	result<-suppressWarnings(spRarefy(
		Heteromys_anomalus_South_America,
		x.col = "X", 
        y.col = "Y",
        10000,
		10
	))
	plot(result)
})


