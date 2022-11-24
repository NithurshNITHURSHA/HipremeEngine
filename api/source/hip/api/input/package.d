/*
Copyright: Marcelo S. N. Mancini (Hipreme|MrcSnm), 2018 - 2021
License:   [https://creativecommons.org/licenses/by/4.0/|CC BY-4.0 License].
Authors: Marcelo S. N. Mancini

	Copyright Marcelo S. N. Mancini 2018 - 2021.
Distributed under the CC BY-4.0 License.
   (See accompanying file LICENSE.txt or copy at
	https://creativecommons.org/licenses/by/4.0/
*/

module hip.api.input;

version(HipInputAPI)
    version = HasHipInput;
else version(Have_hipreme_engine)
    version = HasHipInput;

version(HasHipInput):
public import hip.api.input.mouse;
public import hip.api.input.gamepad;
public import hip.api.input.inputmap;
public import hip.api.input.binding;



alias getMousePosition = getTouchPosition;
alias getNormallizedMousePosition = getNormallizedTouchPosition;
alias getWorldMousePosition = getWorldTouchPosition;
alias getMouseDeltaPosition = getTouchDeltaPosition;