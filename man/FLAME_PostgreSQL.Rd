% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/FLAME_PostgreSQL.R
\name{FLAME_PostgreSQL}
\alias{FLAME_PostgreSQL}
\title{PostgreSQL Database Implementation}
\usage{
FLAME_PostgreSQL(db, data, holdout, compute_var = FALSE,
  tradeoff = 0.1, PE_function = NULL, model = NULL,
  ridge_reg = NULL, lasso_reg = NULL, tree_depth = NULL)
}
\arguments{
\item{db}{name of the database connection (\strong{must name the connection as
db})}

\item{data}{input data}

\item{holdout}{holdout training data}

\item{compute_var}{indicator variable of computing variance (optional, default = FALSE)}

\item{tradeoff}{tradeoff parameter to compute Match Quality (optional, default = 0.1)}

\item{PE_function}{user defined function to compute predictive error
(optional)}

\item{model}{user defined model - Linear, Ridge, Lasso, or DecisionTree
(optional)}

\item{ridge_reg}{L2 regularization parameter if model = Ridge (optional)}

\item{lasso_reg}{L1 regularization parameter if model = Lasso (optional)}

\item{tree_depth}{maximum depth of decision tree if model = DecisionTree
(optional)}
}
\value{
(1) list of covariates FLAME performs matching at each iteration, (2)
Sizes, conditional average treatment effects (CATEs), and variance (if compute_var = TRUE)
of matches at each iteration, (3) match quality at each iteration, and (4) the original
data with additional column *matched*, indicating the number of covariates each unit is
matched on. If a unit is never matched, then *matched* will be 0.
}
\description{
\code{FLAME_PostgreSQL} applies the FLAME algorithm based on PostgreSQL. If
your computer system does not have PostgreSQL installed, install from
\href{https://www.postgresql.org/download/}{here}. For setup of PostgreSQL
server, please refer to this
\href{http://www.postgresqltutorial.com/connect-to-postgresql-database/}{tutorial}.
User must connect to PostgreSQL server in R using the command
\code{dbConnect(dbDriver('PostgreSQL'), dbname="your_dbname",
host='your_localhost', port='your_port', user='your_username', password =
'your_password')} and name the connection as \strong{db}
}
\examples{
\dontrun{
data <- data(toy_data)

drv <- dbDriver('PostgreSQL')

db <- dbConnect(drv, dbname="FLAME", host='localhost',
port=5432, user="postgres", password = 'new_password')

FLAME_PostgreSQL(db = db, data = data, holdout = data)

dbDisconnect(db)
}
}
