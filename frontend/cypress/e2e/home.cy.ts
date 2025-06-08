describe('Home page', () => {
  it('should display the main heading', () => {
    cy.visit('http://localhost:3000');
    cy.get('h1').should('exist');
  });
}); 