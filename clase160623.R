vm_model <- svm(Species ~ ., data=iris,
                kernel="radial") #linear/polynomial/sigmoid
plot(svm_model, data=iris,
     Petal.Width~Petal.Length,
     slice = list(Sepal.Width=3, Sepal.Length=4) 
)
