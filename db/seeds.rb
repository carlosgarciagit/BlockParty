# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# interests
interests = ['Affordable Housing', 'Animal Welfare', 'Biking', 'Childcare', 'Diversity and Inclusion', 'Education', 'Environmental/Sustainability', 'Homelessness', 'Immigration', 'Inequality', 'International Development', 'Job/Employment', 'LGBT', 'Mentorship', 'Public Health', 'Public Safety', 'Public Spaces', 'Science and Innovation', 'Transportation', 'Urban Development']
interests.each do |i|
  it_exists = Interest.find_by(name: i).present?
  unless it_exists
    Interest.create(name: i)
  end
end

# events
towel_event = "Lead a Towel and Clothing Drive"
unless Event.find_by(name: towel_event).present?
  Event.create!(name: towel_event,
               description:"""
  <div>
    <p><strong>When</strong>: Now - End of May</p>
    <p><strong>Where</strong>: Donation drive at MIT for shelter at 240 Albany Street, Cambridge, MA, 02139</p>
    <p><strong>Action: Become one of 2-3 needed volunteer leaders to coordinate a towel and clothing donation drive through the end of May</strong> for the local homeless shelter CASPAR! The shelter needs: as many used or new towels as possible, donated, new cotton briefs and cotton boxers for women and men. Read more about CASPAR here:&nbsp;http://casparinc.org/about-us.html. They provide community services to help those who are homeless and especially in recovery from substance abuse disorders. Your support CASPAR keep their doors open to treatment and directly impacts the health of our community.</p>
    <p>Sign up and make a difference! Drive Leads will be eligible to attend a special VIP Event with Ministry of Supply.</p>
    <h5>Interested in become a Drive Lead? Sign up Below!</h5>
  </div>
""",
               start_time: "2017-06-01 00:00:00",
               end_time: "2017-09-01 00:00:00"
               )
end

