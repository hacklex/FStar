(*
   Copyright 2008-2018 Microsoft Research

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*)
module FStar.Tactics

(* I don't expect many uses of tactics without syntax handling *)
include FStar.Reflection.Types
include FStar.Reflection.Data
include FStar.Reflection.Builtins
include FStar.Reflection.Derived
include FStar.Reflection.Formula
include FStar.Reflection.Const
include FStar.Reflection.Compare

include FStar.Tactics.Types
include FStar.Tactics.Effect
include FStar.Tactics.Builtins
include FStar.Tactics.Derived
include FStar.Tactics.Logic
include FStar.Tactics.Util
include FStar.Tactics.SyntaxHelpers
include FStar.Tactics.Print
include FStar.Tactics.Visit
