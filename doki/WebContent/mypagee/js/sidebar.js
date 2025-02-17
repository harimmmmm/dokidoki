document.addEventListener('DOMContentLoaded', function() {
    var currentUrl = window.location.href; 

    if (currentUrl.includes('home')) {
        document.getElementById('home-link').style.boxShadow = '4px 0 0 0 #6ab2a9 inset';
    } else if (currentUrl.includes('edit')) {
        document.getElementById('edit-link').style.boxShadow = '4px 0 0 0 #6ab2a9 inset';
    } else if (currentUrl.includes('upcoming')) {
        document.getElementById('upcoming-link').style.boxShadow = '4px 0 0 0 #6ab2a9 inset';
    } else if (currentUrl.includes('past')) {
        document.getElementById('past-link').style.boxShadow = '4px 0 0 0 #6ab2a9 inset';
    } else if (currentUrl.includes('canceled')) {
        document.getElementById('canceled-link').style.boxShadow = '4px 0 0 0 #6ab2a9 inset';
    } else if (currentUrl.includes('interest')) {
        document.getElementById('interest-link').style.boxShadow = '4px 0 0 0 #6ab2a9 inset';
    } else if (currentUrl.includes('inquiries')) {
        document.getElementById('inquiries-link').style.boxShadow = '4px 0 0 0 #6ab2a9 inset';
    }
});
