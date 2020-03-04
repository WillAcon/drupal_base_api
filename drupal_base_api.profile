<?php

/**
 * @file
 * Enables modules and site configuration for a drupal_base site installation.
 */

use Drupal\contact\Entity\ContactForm;
use Drupal\Core\Form\FormStateInterface;


/**
 * Submission handler to sync the contact.form.feedback recipient.
 */
function drupal_base_form_install_configure_submit($form, FormStateInterface $form_state) {
  $site_mail = $form_state->getValue('site_mail');
  ContactForm::load('feedback')->setRecipients([$site_mail])->trustData()->save();
}
