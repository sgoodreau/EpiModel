
#' @title Epidemic Parameters for Deterministic Compartmental Models
#'
#' @description Sets the epidemic parameters for deterministic compartmental
#'              models simulated with \code{dcm}.
#'
#' @param trans.rate probability of transmission given a transmissible act between
#'        a susceptible and an infected person. In two-group models, this is the
#'        probability of transmission to the group 1 members.
#' @param act.rate average number of transmissible acts per person per unit time.
#'        For two-group models, this is the number of acts per group 1 persons
#'        per unit time; a balance between the acts in groups 1 and 2 is necessary,
#'        and set using the \code{balance} parameter (see details).
#' @param rec.rate average rate of recovery with immunity (in \code{SIR} models)
#'        or re-susceptibility (in \code{SIS} models). The recovery rate is the
#'        reciprocal of the disease duration. For two-group models, this is the
#'        recovery rate for group 1 persons only. This parameter is only used for
#'        \code{SIR} and \code{SIS} models.
#' @param b.rate birth or entry rate. For one-group models, the birth rate is the
#'        rate of new births per person per unit time. For two-group models, the
#'        birth rate may be parameterized as a rate per group 1 person time (with
#'        group 1 persons representing females), and with the \code{b.rate.g2}
#'        rate set as described below.
#' @param ds.rate death or exit rate for susceptible. For two-group models, it
#'        is the rate for the group 1 susceptible only.
#' @param di.rate death or exit rate for infected. For two-group models, it is
#'        the rate for the group 1 infected only.
#' @param dr.rate death or exit rate for recovered. For two-group models, it is
#'        the rate for the group 1 recovered only. This parameter is only used for
#'        \code{SIR} models.
#' @param trans.rate.g2 probability of transmission given a transmissible act
#'        between a susceptible group 2 person and an infected group 1 person.
#'        It is the probability of transmission to group 2 members.
#' @param act.rate.g2 average number of transmissible acts per group 2 person per
#'        unit time; a balance between the acts in groups 1 and 2 is necessary,
#'        and set using the \code{balance} parameter (see details).
#' @param rec.rate.g2 average rate of recovery with immunity (in \code{SIR} models)
#'        or re-susceptibility (in \code{SIS} models) for group 2 persons. This
#'        parameter is only used for two-group \code{SIR} and \code{SIS} models.
#' @param b.rate.g2 birth or entry rate for group 2. This may either be specified
#'        numerically as the rate of new births per group 2 persons per unit time,
#'        or as \code{NA} in which case the group 1 rate, \code{b.rate}, governs
#'        the group 2 rate. The latter is used when, for example, the first group
#'        is conceptualized as female, and the female population size determines
#'        the birth rate. Such births are evenly allocated between the two groups.
#' @param ds.rate.g2 death or exit rate for group 2 susceptible.
#' @param di.rate.g2 death or exit rate for group 2 infected.
#' @param dr.rate.g2 death or exit rate for group 2 recovered. This parameter is
#'        only used for \code{SIR} model types.
#' @param balance for two-group models, balance the \code{act.rate} to the rate
#'        set for group 1 (with \code{balance="g1"}) or group 2 (with
#'        \code{balance="g2"}). See details.
#' @param ... additional arguments passed to model.
#'
#' @details
#' \code{param.dcm} sets the epidemic parameters for deterministic compartmental
#' models solved with the \code{\link{dcm}} function. The models may use the
#' built-in types, for which these parameters are used, or original model
#' specifications for which these parameters may be used (but not necessarily).
#' A detailed description of DCM parameterization for built-in models is found
#' in Section 2 of the
#' \href{http://statnet.org/EpiModel/vignette/Tutorial.pdf}{EpiModel Tutorial}.
#'
#' For built-in models, the model specification will be selected as a function
#' of the model parameters entered here and the control settings in
#' \code{\link{control.dcm}}. One-group and two-group models are available, where
#' the former assumes a homogenous mixing in the population and the latter
#' assumes a purely heterogenous mixing between two distinct partitions in the
#' population (e.g., men and women). Specifying any group two parameters (those
#' with a \code{.g2}) implies the simulation of a two-group model. All the
#' parameters for a desired model type must be specified, even if they are zero.
#'
#' @section Act Balancing:
#' In two-group models, a balance between the number of acts for group 1 members
#' and those for group 2 members must be maintained. With purely heterogenous
#' mixing, the product of one group size and act rate must equal the product of
#' the other group size and act rate: \eqn{N_1 \alpha_1 = N_2 \alpha_2}, where
#' \eqn{N_i} is the group size and \eqn{\alpha_i} the group-specific act rates
#' at time \eqn{t}. The \code{balance} parameter here specifies which group's
#' act rate should control the others with respect to balancing. See the
#' \href{http://statnet.org/EpiModel/vignette/Tutorial.pdf}{EpiModel Tutorial}
#' for further details.
#'
#' @section Sensitivity Analyses:
#' \code{dcm} has been designed to easily run DCM sensitivity analyses, where a
#' series of models varying one or more of the model parameters is run. This is
#' possible by setting any parameter as a vector of length greater than one. See
#' both the example below and the
#' \href{http://statnet.org/EpiModel/vignette/Tutorial.pdf}{EpiModel Tutorial}
#' for details.
#'
#' @section New Model Types:
#' To build original model specifications outside of the built-in models, start
#' by consulting the \href{http://statnet.org/EpiModel/vignette/NewDCMs.html}{Solving
#' New DCMs with EpiModel} tutorial. Briefly, an original model may use either
#' the existing model parameters named here, an original set of parameters, or
#' a combination of both. The \code{...} argument allows the user to pass an
#' arbitrary set of new model parmeters into \code{param.dcm}. Whereas there are
#' strict checks for built-in models that the model parameters are valid,
#' parameter validity is the user's responsibility with these original models.
#'
#' @seealso Use \code{\link{init.dcm}} to specify the initial conditions and
#'          \code{\link{control.dcm}} to specify the control settings. Run the
#'          parameterized model with \code{\link{dcm}}.
#'
#' @keywords parameterization
#'
#' @export
#'
param.dcm <- function(trans.rate,
                      act.rate,
                      rec.rate,
                      b.rate,
                      ds.rate,
                      di.rate,
                      dr.rate,
                      trans.rate.g2,
                      act.rate.g2,
                      rec.rate.g2,
                      b.rate.g2,
                      ds.rate.g2,
                      di.rate.g2,
                      dr.rate.g2,
                      balance,
                      ...) {

  ## Pull parameters
  out <- as.list(match.call(expand.dots = TRUE)[-1])


  ## Split lists
  out <- split_list(out)


  ## Eval args
  out <- eval_list(out)


  ## Out
  class(out) <- "param.dcm"
  return(out)
}


#' @title Epidemic Parameters for Stochastic Individual Contact Models
#'
#' @description Sets the epidemic parameters for stochastic individual contact
#'              models simulated with \code{icm}.
#'
#' @inheritParams param.dcm
#'
#' @details
#' \code{param.icm} sets the epidemic parameters for the stochastic individual
#' contact models simulated with the \code{\link{icm}} function. Models
#' may use the built-in types, for which these parameters are used, or new process
#' modules which may use these parameters (but not necessarily). A detailed
#' description of ICM parameterization for built-in models is found in Section 3
#' of the \href{http://statnet.org/EpiModel/vignette/Tutorial.pdf}{EpiModel
#' Tutorial}.
#'
#' For built-in models, the model specification will be chosen as a result of
#' the model parameters entered here and the control settings in
#' \code{\link{control.icm}}. One-group and two-group models are available, where
#' the former assumes a homogenous mixing in the population whereas the latter
#' assumes a purely heterogenous mixing between two distinct partitions in the
#' population (e.g., men and women). Specifying any group two parameters (those
#' with a \code{.g2}) implies the simulation of a two-group model. All the
#' parameters for a desired model type must be specified, even if they are zero.
#'
#' @section Act Balancing:
#' In two-group models, a balance between the number of acts for group 1 members
#' and those for group 2 members must be maintained. With purely heterogenous
#' mixing, the product of one group size and act rate must equal the product of
#' the other group size and act rate: \eqn{N_1 \alpha_1 = N_2 \alpha_2}, where
#' \eqn{N_i} is the group size and \eqn{\alpha_i} the group-specific act rates
#' at time \eqn{t}. The \code{balance} parameter here specifies which group's
#' act rate should control the others with respect to balancing. See the
#' \href{http://statnet.org/EpiModel/vignette/Tutorial.pdf}{EpiModel Tutorial}
#' for further details.
#'
#' @section New Modules:
#' To build original models outside of the built-in models, new process modules
#' may be constructed to replace the existing modules or to supplement the existing
#' set. These are passed into the control settings in \code{\link{control.icm}}.
#' New modules may use either the existing model parameters named here, an
#' original set of parameters, or a combination of both. The \code{...} allows
#' the user to pass an arbitrary set of original model parmeters into
#' \code{param.icm}. Whereas there are strict checks with default modules for
#' parameter validity, these checks are the user's responsibility with new modules.
#'
#' @seealso Use \code{\link{init.icm}} to specify the initial conditions and
#'          \code{\link{control.icm}} to specify the control settings. Run the
#'          parameterized model with \code{\link{icm}}.
#'
#' @keywords parameterization
#'
#' @export
#'
param.icm <- function(trans.rate,
                      act.rate,
                      rec.rate,
                      b.rate,
                      ds.rate,
                      di.rate,
                      dr.rate,
                      trans.rate.g2,
                      act.rate.g2,
                      rec.rate.g2,
                      b.rate.g2,
                      ds.rate.g2,
                      di.rate.g2,
                      dr.rate.g2,
                      balance,
                      ...) {

  ## Pull parameters
  out <- as.list(match.call(expand.dots = TRUE)[-1])


  ## Split lists
  out <- split_list(out)


  ## Eval args
  out <- eval_list(out)


  ## Defaults and checks
  if (is.null(out$groups)) {
    out$groups <- 1
  }
  if (is.null(out$act.rate)) {
    out$act.rate <- 1
  }
  if (!is.null(out$b.rate) | !is.null(out$ds.rate) |
      !is.null(out$di.rate) | !is.null(out$dr.rate)) {
    out$vital <- TRUE
  } else {
    out$vital <- FALSE
  }

  if (any(grepl(".g2", names(out))) == TRUE) {
    out$groups <- 2
  } else {
    out$groups <- 1
  }

  if (is.null(out$trans.rate)) {
    stop("Specify trans.rate")
  }

  if (out$groups == 2 && (is.null(out$balance) ||
                          !(out$balance %in% c("g1", "g2")))) {
    stop("Specify balance=\"g1\" or balance=\"g2\" with 2-group models")
  }

  ## Output
  class(out) <- "param.icm"
  return(out)
}


#' @title Epidemic Parameters for Stochastic Network Models
#'
#' @description Sets the epidemic parameters for stochastic network models
#'              simulated with \code{\link{netsim}}.
#'
#' @param trans.rate probability of transmission given a transmissible act between
#'        a susceptible and an infected person. In bipartite models, this is the
#'        probability of transmission to the mode 1 nodes.
#' @param act.rate average number of transmissible acts \emph{per partnership}
#'        per unit time (see details).
#' @param rec.rate average rate of recovery with immunity (in \code{SIR} models)
#'        or re-susceptibility (in \code{SIS} models). The recovery rate is the
#'        reciprocal of the disease duration. For bipartite models, this is the
#'        recovery rate for mode 1 persons only. This parameter is only used for
#'        \code{SIR} and \code{SIS} models.
#' @param b.rate birth or entry rate. For one-mode models, the birth rate is the
#'        rate of new births per person per unit time. For bipartite models, the
#'        birth rate may be parameterized as a rate per mode 1 person time (with
#'        mode 1 persons representing females), and with the \code{b.rate.g2}
#'        rate set as described below.
#' @param ds.rate death or exit rate for susceptible. For bipartite models, it
#'        is the rate for the mode 1 susceptible only.
#' @param di.rate death or exit rate for infected. For bipartite models, it is
#'        the rate for the mode 1 infected only.
#' @param dr.rate death or exit rate for recovered. For bipartite models, it is
#'        the rate for the mode 1 recovered only. This parameter is only used for
#'        \code{SIR} models.
#' @param trans.rate.m2 probability of transmission given a transmissible act
#'        between a susceptible mode 2 person and an infected mode 1 person.
#'        It is the probability of transmission to mode 2 members.
#' @param rec.rate.m2 average rate of recovery with immunity (in \code{SIR} models)
#'        or re-susceptibility (in \code{SIS} models) for mode 2 persons. This
#'        parameter is only used for bipartite \code{SIR} and \code{SIS} models.
#' @param b.rate.m2 birth or entry rate for mode 2. This may either be specified
#'        numerically as the rate of new births per mode 2 persons per unit time,
#'        or as \code{NA} in which case the mode 1 rate, \code{b.rate}, governs
#'        the mode 2 rate. The latter is used when, for example, the first mode
#'        is conceptualized as female, and the female population size determines
#'        the birth rate. Such births are evenly allocated between the two modes.
#' @param ds.rate.m2 death or exit rate for mode 2 susceptible.
#' @param di.rate.m2 death or exit rate for mode 2 infected.
#' @param dr.rate.m2 death or exit rate for mode 2 recovered. This parameter is
#'        only used for \code{SIR} model types.
#' @param ... additional arguments passed to model.
#'
#' @details
#' \code{param.net} sets the epidemic parameters for the stochastic network
#' models simulated with the \code{\link{netsim}} function. Models
#' may use the built-in types, for which these parameters are used, or new process
#' modules which may use these parameters (but not necessarily). A detailed
#' description of network model parameterization for built-in models is found in
#' Section 4 of the \href{http://statnet.org/EpiModel/vignette/Tutorial.pdf}{EpiModel
#' Tutorial}.
#'
#' For built-in models, the model specification will be chosen as a result of
#' the model parameters entered here and the control settings in
#' \code{\link{control.net}}. One-mode and two-mode models are available, where
#' the the latter assumes a heterogenous mixing between two distinct partitions
#' in the population (e.g., men and women). Specifying any bipartite parameters
#' (those with a \code{.m2}) implies the simulation of a bipartite model. All the
#' parameters for a desired model type must be specified, even if they are zero.
#'
#' @section The act.rate Parameter:
#' A key difference between these network models and DCM/ICM classes is the
#' treatment of transmission events. With DCM and ICM, contacts or partnerships are
#' mathematically instantaneous events: they have no duration in time, and thus
#' no changes may occur within them over time. In contrast, network models allow
#' for partnership durations defined by the dynamic network model, summarized in
#' the model dissolution coefficients calculated in \code{\link{dissolution_coefs}}.
#' Therefore, the \code{act.rate} parameter has a different interpretation here,
#' where it is the number of transmissible acts \emph{per partnership} per unit
#' time.
#'
#' @section New Modules:
#' To build original models outside of the built-in models, new process modules
#' may be constructed to replace the existing modules or to supplement the existing
#' set. These are passed into the control settings in \code{\link{control.net}}.
#' New modules may use either the existing model parameters named here, an
#' original set of parameters, or a combination of both. The \code{...} allows
#' the user to pass an arbitrary set of original model parmeters into
#' \code{param.net}. Whereas there are strict checks with default modules for
#' parameter validity, these checks are the user's responsibility with new modules.
#'
#' @seealso Use \code{\link{init.net}} to specify the initial conditions and
#'          \code{\link{control.net}} to specify the control settings. Run the
#'          parameterized model with \code{\link{netsim}}.
#'
#' @keywords parameterization
#'
#' @export
#'
param.net <- function(trans.rate,
                      act.rate,
                      rec.rate,
                      b.rate,
                      ds.rate,
                      di.rate,
                      dr.rate,
                      trans.rate.m2,
                      rec.rate.m2,
                      b.rate.m2,
                      ds.rate.m2,
                      di.rate.m2,
                      dr.rate.m2,
                      ...) {

  ## Pull parameters
  out <- as.list(match.call(expand.dots = TRUE)[-1])


  ## Split lists
  out <- split_list(out)


  ## Eval args
  out <- eval_list(out)


  ## Defaults
  if (missing(act.rate)) {
    out$act.rate <- 1
  }
  if (!missing(b.rate) | !missing(ds.rate) |
      !missing(di.rate) | !missing(dr.rate)) {
    out$vital <- TRUE
  } else {
    out$vital <- FALSE
  }

  ## Parameter check
  if (missing(trans.rate)) {
    stop("Specify trans.rate")
  }


  ## Output
  class(out) <- "param.net"
  return(out)
}
