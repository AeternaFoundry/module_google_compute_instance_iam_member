resource "google_compute_instance_iam_member" "compute_instance_iam_members" {
  for_each = var.compute_instance_iam_members

  instance_name = each.value.instance_name
  member        = each.value.member
  role          = each.value.role
  project       = each.value.project
  zone          = each.value.zone

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

