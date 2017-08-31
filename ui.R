aaa <- c("The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel",
         "consumption and 10 aspects of automobile design and performance for 32 automobiles")

fluidPage(
  
  # App title ----
  titlePanel("MTCars Explorer"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Select number of cylinders ----
      radioButtons("cyl", "Number of cylinders:",
                   c("Any" = 0,
                     "Four" = 4,
                     "Six" = 6,
                     "Eight" = 8)),
      
      br(),
      
      # Input: Select type of transmission ----
      radioButtons("am", "Transmission:",
                   c("Any" = 2,
                     "Auto" = 0,
                     "Manual" = 1)),
      
      br(),
      
      # Input: Slider for horsepower ----
      sliderInput("hp",
                  "Value of Gross horsepower:",
                  value = 335,
                  min = 52,
                  max = 335)
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Tabset ----
      tabsetPanel(type = "tabs",
                  tabPanel("Plot", tags$small("The left slidebar contains input fields with which you can filter the dataset by number of cylinders, type of transmissions and horsepower. Filter and enjoy!"),
                           plotOutput("plot"),
                           span("Number of cars selected:", textOutput("n_cars"))),
                  tabPanel("Data structure", verbatimTextOutput("summary")),
                  tabPanel("Table", tableOutput("table")),
                  tabPanel("About data", 
                           tags$h5("The data was extracted from the 1974 Motor Trend US magazine, and comprises fue",
                                   "consumption and 10 aspects of automobile design and performance for 32 automobiles."),
                           tags$br(),
                           tags$b("Format"),
                           tags$br(),tags$br(),
                           tags$small("A data frame with 32 observations on 11 variables:"),                          
                           tags$br(),
                           tags$small("[, 1]	 mpg	 Miles/(US) gallon"),  
                           tags$br(),
                           tags$small("[, 2]	 cyl	 Number of cylinders"),
                           tags$br(), 
                           tags$small("[, 3]	 disp	 Displacement (cu.in.)"),
                           tags$br(), 
                           tags$small("[, 4]	 hp	 Gross horsepower"),
                           tags$br(), 
                           tags$small("[, 5]	 drat	 Rear axle ratio"),
                           tags$br(), 
                           tags$small("[, 6]	 wt	 Weight (1000 lbs)"),
                           tags$br(), 
                           tags$small("[, 7]	 qsec	 1/4 mile time"),
                           tags$br(), 
                           tags$small("[, 8]	 vs	 V/S"),
                           tags$br(), 
                           tags$small("[, 9]	 am	 Transmission (0 = automatic, 1 = manual)"),
                           tags$br(), 
                           tags$small("[,10]	 gear	 Number of forward gears"),
                           tags$br(), 
                           tags$small("[,11]	 carb	 Number of carburetors")
                  )
      )
      
    )
  )
)