module.exports = {
  content: ['./templates/**/*.twig', './templates/**/*.html'],
  theme: {
    extend: {
      keyframes: {
        strikeitem: {
          to: { width: 'calc(100% + 1rem)' },
        },
      },
      animation: {
        strikeitem: 'strikeitem .3s ease-out 0s forwards',
      },
    },
  },
  plugins: [require('@tailwindcss/forms')],
};
