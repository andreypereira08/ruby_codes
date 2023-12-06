/* eslint-disable no-multiple-empty-lines */
/* eslint-disable prefer-const */
/* eslint-disable import/extensions */

import runChallenges from "../spec/even_or_odd_examiner.js";

export const evenOrOdd = (number) => {
  // TODO: this should return "even" if the number is even, "odd" otherwise
  let result = "";
  if (number % 2 === 0) {
    result = "even";
  } else {
    result = "odd";
  }
  return result;
};

// Checking exercise answers. DO NOT MODIFY THIS LINE.
runChallenges(evenOrOdd);
