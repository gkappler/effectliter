
shinyUI(fluidPage(
  titlePanel(title="EffectLiteR"),
  
  sidebarLayout(
  sidebarPanel(
    tabsetPanel(
      ######### Data ############
      tabPanel('Data',
        img(src='effectliter_logo.png', align = "right"),
        br(),
        br(),
        actionButton("newanalysis","Start a New Analysis"),
        uiOutput("reload"),
        hr(),        
        selectizeInput(inputId="exdata", label="Example Data", selected="",
                       choices= c("","nonortho","example01","example02lv",
                                  "example_multilevel"),
                       options = list(placeholder = 'choose example data')),    
        hr(),
        tryCatch(
          fileInput("file1", "Data File", 
                    accept=c(".csv", ".txt", ".sav", ".xpt", 
                              ".CSV", ".TXT", ".SAV", ".XPT",
                             ".DAT", ".dat"))
        ),
        helpText('Select either a .csv, .dat, .txt, .sav or a .xpt file to be uploaded. The corresponding R function (read.csv, read.table, read.spss, or read.xport) will be chosen automatically with the default settings for arguments. Some default arguments can be overwritten (see additional options below).'),
        br(),
        h5(strong("Additional Options to Read Data")),
        br(),
        selectizeInput(inputId="vallabels", 
                       label=h5("Use value labels (SPSS data)"), 
                       selected="default",
                       choices= c("default","yes","no")),
        selectizeInput(inputId="header", 
                       label=h5("File contains variable names (csv, dat, and txt data)"), 
                       selected="default",
                       choices= c("default","yes","no")),
        selectizeInput(inputId="sep", 
                       label=h5("Character separating columns (csv, dat, and txt data)"), 
                       selected="default",
                       choices= c("default","semicolon","white space")),
        selectizeInput(inputId="dec", 
                       label=h5("Decimal character (csv, dat, and txt data)"), 
                       selected="default",
                       choices= c("default","decimal point","decimal comma")),
        textInput(inputId="na.strings", 
                  label=h5("Missing value code (csv, dat, and txt data)"), 
                  value = "NA"),
        br()
      ),
      ########## Manifest Variables ############
      tabPanel('Manifest Variables',
               img(src='effectliter_logo.png', align = "right"),
#                submitButton(text = "Run", icon = NULL),
               conditionalPanel(
                  condition = "!input.latenty",
                  br(),
                  br(),
                  br(),
                  selectizeInput("variabley", "Dependent Variable Y", "",
                        options = list(placeholder = 'select dependent variable'))
               ),
               br(),
               selectizeInput("variablex", "Treatment Variable X", "",
                    options = list(placeholder = 'select treatment variable')),
               br(),
               selectizeInput("variablek", "Categorical Covariates K", "", 
                   multiple=TRUE, selected="",
                   options = list(placeholder = 'select categorical covariates')),
               br(),
               selectizeInput("variablez", "Continuous Covariates Z", "", 
                              multiple=TRUE, selected="",
                    options = list(placeholder = 'select continuous covariates')),
br(),
br(),
br(),
br(),
br(),
br(),
br(),
br(),
br(),
br()
      ),
      ############ Latent Variables ###########
      tabPanel('Latent Variables',
        img(src='effectliter_logo.png', align = "right"),       
        h5("Latent Dependent Variable"),       
        checkboxInput("latenty", "The dependent variable is latent", FALSE),        
        conditionalPanel(
          condition = "input.latenty",
          p("If the dependent variable is latent, entries under manifest dependent variable will be discarded."),
          ###
          br(),
          h5("Latent Dependent Variable"),
          textInput("name.etay", "Name of Latent Dependent Variable", 
                    value = "etay"),
          selectInput("indicatorsy", "Indicators of Latent Dependent Variable", "",
                      multiple=TRUE, selectize=TRUE),
          radioButtons("mm.etay", "Measurement Model for Latent Dependent Variable",
                       choices = c("equivalent measures" = "parallel",
                                   "essentially equivalent measures" = "tau-equi",
                                   "congeneric measures" = "tau-cong"),
                       selected = "parallel")
        ),
        br(),
        hr(),
        br(),
        h5("Latent Covariates"),
        checkboxInput("latentz", "Add latent covariates", FALSE),
        conditionalPanel(
          condition = "input.latentz",
          helpText("Latent covariates will be added to the list of continuous manifest covariates (if specified)."),
          numericInput("nlatentz", "Number of Latent Covariates", 0,
                       min = 0, max = 5),
          ### Cov 1
          conditionalPanel(
            condition = "input.nlatentz > 0",
            br(),
            h5("Latent Covariate 1"),
            textInput("name.etaz1", "Name of Latent Covariate 1", 
                      value = "etaz1"),
            selectInput("indicatorsz1", "Indicators of Latent Covariate 1", "",
                        multiple=TRUE, selectize=TRUE),
            radioButtons("mm.etaz1", "Measurement Model for Latent Covariate 1",
                        choices = c("equivalent measures" = "parallel",
                                    "essentially equivalent measures" = "tau-equi",
                                    "congeneric measures" = "tau-cong"))
          ),
          ### Cov 2
          conditionalPanel(
            condition = "input.nlatentz > 1",
            br(),
            h5("Latent Covariate 2"),
            textInput("name.etaz2", "Name of Latent Covariate 2", 
                      value = "etaz2"),
            selectInput("indicatorsz2", "Indicators of Latent Covariate 2", "",
                        multiple=TRUE, selectize=TRUE),
            radioButtons("mm.etaz2", "Measurement Model for Latent Covariate 2",
                         choices = c("equivalent measures" = "parallel",
                                     "essentially equivalent measures" = "tau-equi",
                                     "congeneric measures" = "tau-cong"))
          ),  
          ### Cov 3
          conditionalPanel(
            condition = "input.nlatentz > 2",
            br(),
            h5("Latent Covariate 3"),
            textInput("name.etaz3", "Name of Latent Covariate 3", 
                      value = "etaz3"),
            selectInput("indicatorsz3", "Indicators of Latent Covariate 3", "",
                        multiple=TRUE, selectize=TRUE),
            radioButtons("mm.etaz3", "Measurement Model for Latent Covariate 3",
                         choices = c("equivalent measures" = "parallel",
                                     "essentially equivalent measures" = "tau-equi",
                                     "congeneric measures" = "tau-cong"))
          ),  
          ### Cov 4
          conditionalPanel(
            condition = "input.nlatentz > 3",
            br(),
            h5("Latent Covariate 4"),
            textInput("name.etaz4", "Name of Latent Covariate 4", 
                      value = "etaz4"),
            selectInput("indicatorsz4", "Indicators of Latent Covariate 4", "",
                        multiple=TRUE, selectize=TRUE),
            radioButtons("mm.etaz4", "Measurement Model for Latent Covariate 4",
                         choices = c("equivalent measures" = "parallel",
                                     "essentially equivalent measures" = "tau-equi",
                                     "congeneric measures" = "tau-cong"))
          ),  
          ### Cov 5
          conditionalPanel(
            condition = "input.nlatentz > 4",
            br(),
            h5("Latent Covariate 5"),
            textInput("name.etaz5", "Name of Latent Covariate 5", 
                      value = "etaz5"),
            selectInput("indicatorsz5", "Indicators of Latent Covariate 5", "",
                        multiple=TRUE, selectize=TRUE),
            radioButtons("mm.etaz5", "Measurement Model for Latent Covariate 5",
                         choices = c("equivalent measures" = "parallel",
                                     "essentially equivalent measures" = "tau-equi",
                                     "congeneric measures" = "tau-cong"))
          )            
        )
      ),
      ########## Options #############
      tabPanel('Options',
        img(src='effectliter_logo.png', align = "right"),
        br(),
        br(),
        br(),
        selectInput("control", "Control Group", ""),
        br(),
        radioButtons("missing", "Missing Data", 
                     choices=c("listwise","fiml"), 
                     selected = "listwise"),
        br(),
        radioButtons("se", "Standard Errors", 
                     choices=c("standard","boot","first.order",
                               "robust.sem","robust.huber.white"), ##TODO: add robust SE 
                     selected = "standard"),
        conditionalPanel(
          condition = "input.se == 'boot'",
          numericInput("bootstrap", "Number of bootstrap draws", 
                      min=1, max=5000, value=5)
        ),
        br(),
        radioButtons("fixed.cell", "Cell Sizes", 
                     choices=c("stochastic","fixed"), 
                     selected = "stochastic"),
        br(),
        h5("Additional Options"),
        checkboxInput("homoscedasticity", "Homoscedastic residual variances", 
                      value=FALSE),
        br(),
        h5("Add to lavaan Syntax"),
        tags$textarea(id="add.syntax", rows=5, cols=40, ""),
        helpText('This option is for advanced users. The text will be appended to the lavaan syntax generated by EffectLiteR. It can for example be used to add additional (in-)equality constraints or to compute user-defined conditional effects.')
        
    ),
########## Interactions #############
    tabPanel('Interactions',
         img(src='effectliter_logo.png', align = "right"),
         br(),
         helpText('Below you find some pre-defined sets of constraints on interactions. You can consult the regression model in the main output to see which coefficients are fixed to zero. In addition, you can use the additional options input to specify customized constraints.'),        
         br(),
         radioButtons("interactions", "Interactions", 
                      choices=c("Full model"="all",
                                "Only two-way interactions"="2-way",
                                "Only X:K interactions"="X:K",
                                "Only X:Z interactions"="X:Z",                                
                                "No treatment*covariate interactions"="none"), 
                      selected = "all"),
         br()                
      ),
########## Propensity Scores #############
      tabPanel('Propensity Scores',
         img(src='effectliter_logo.png', align = "right"),
         br(),
         helpText('Propensity scores are predicted probabilities from a multinomial regression of the treatment variable on below selected covariates. The logit transformed propensity score(s) are included as continuous covariates in the EffectLiteR analysis. For more flexibility, you can specify the formula yourself.'),        
         br(),
         conditionalPanel(
           condition = "!input.propscoreformula",
           br(),

           selectizeInput("propscore", "Covariates in Propensity Score Model", "",
                          multiple=TRUE, selected="",
                          options = list(placeholder = 'select covariates'))
         ),
         br(),
         checkboxInput("propscoreformula", "Specify formula for propensity score model yourself", FALSE),
         conditionalPanel(
           condition = "input.propscoreformula",
           br(),           
           textInput("prop.formula", "Specify formula", 
                     value = "")
         )
                  
      ),

########## Complex Survey #############
tabPanel('Complex Survey',
         img(src='effectliter_logo.png', align = "right"),
         br(),
         helpText('The lavaan.survey package is called to account for cluster variables and sampling weights. This is an experimental feature.'),        
         br(),
         selectizeInput("ids", "Cluster Variable", "",
                        multiple=FALSE, selected="",
                        options = list(placeholder = 'select cluster ID')),
         selectizeInput("weights", "Sampling Weights", "",
                        multiple=FALSE, selected="",
                        options = list(placeholder = 'select sampling weights')),
         helpText('Note: Only use weights if you know what you are doing. For example, some conditional treatment effects may require different weights than average effects.')
         
      )
  )),
  
  mainPanel(
    tabsetPanel(
      ######### Data Table ##########
      tabPanel('Data', dataTableOutput("mytable1")),
      
      ######### EffectLiteR ##########
      tabPanel("EffectLiteR", verbatimTextOutput("summary")),
      
      ######### lavaan Syntax ##########
      tabPanel("lavaan Syntax",
               br(),
               downloadLink('downloadLavData', 'Download Data for lavaan'),
               br(),
               br(),
               verbatimTextOutput("elrcall"),
               verbatimTextOutput("lavcall"),
               verbatimTextOutput("lavsyntax")),
      
      ######### lavaan Results ##########
      tabPanel("lavaan Results", verbatimTextOutput("lavresults")),
      
      ######### Conditional Effects ##########
      tabPanel('Conditional Effects', 
               verbatimTextOutput("helptextcondeffects"),
               downloadLink('downloadConditionalEffects', 'Download Conditional Effects Data'),
               br(),
               br(),
               dataTableOutput("condeffs")),
      
      ######### Plot 1 ##########
      tabPanel("Plot 1", 
               verbatimTextOutput("helptextplot1"),
               plotOutput("plot1")
      ),
      
      ######### Plot 2 ##########
      tabPanel("Plot 2", 
        verbatimTextOutput("helptextplot2"),
        selectInput("zselect", 
            "Select continuous covariate", "", 
            multiple=FALSE,
            selectize=TRUE                 
        ),
      plotOutput("plot2")),
      
      ######### Plot 3 ##########
      tabPanel("Plot 3",
              verbatimTextOutput("helptextplot3"),
              selectInput("gxselect", 
                          "Select effect function (y-axis)", 
                          "g1(K,Z)", 
                          multiple=FALSE,
                          selectize=TRUE),
              selectInput("zselect2", 
                          "Select regressor  (x-axis)", 
                          "", 
                          multiple=FALSE,
                          selectize=TRUE),
              selectInput("zselect3", 
                          "Select colour variable", 
                          "", 
                          multiple=FALSE,
                          selectize=TRUE),
               plotOutput("plot3")) #,
#       
#       ######### Path Diagram ##########
#       tabPanel("Path Diagram", plotOutput("plotpd"))
            
    )    
  ))

))