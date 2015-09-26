%% ======================================================================
%% basic_datas.pl
%% programme de test pour les prédicat assert, retract, dynamic.
%% ======================================================================

:- module(basic_data,
	[homme/1, femme/1, 
	pere/2, mere/2]).

%% les prédicats suivants sont déjà en partie existant
%% ils sot donc dynamic en vue de leurs modifications
:- dynamic homme/1.
:- dynamic femme/1.
:- dynamic pere/2.
:- dynamic mere/2.

%% les données
homme(bernard).
homme(jean).
femme(monique).

pere(jean, bernard).
mere(monique, bernard).