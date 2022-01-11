interface Breakpoint {
  xs: number;
  sm: number;
  md: number;
  lg: number;
  xl: number;
}

const breakpoints: Breakpoint = {
  xs: 576,
  sm: 768,
  md: 992,
  lg: 1200,
  xl: 1536,
};

export const up = (size: keyof Breakpoint) =>
  `@media (min-width: ${breakpoints[size]}px)`;

export const down = (size: keyof Breakpoint) =>
  `@media (max-width: ${breakpoints[size]}px)`;
